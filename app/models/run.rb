class Run < ApplicationRecord
  belongs_to :user

  has_many :blocks, :dependent => :destroy

  has_many :video_runs
  has_many :videos, through: :video_runs

  accepts_nested_attributes_for :blocks

  # @TODO : This method should be performed in a job
  def generate_blocks
    videos.each do |v|
      description_parts = v.description.split("\n\n")
      description_parts.each do |description_part|
        new_block = blocks.find_or_create_by(content: description_part)
        new_block.videos << v
      end
    end

    blocks
  end

  def delete_false_blocks
    blocks.where(video_blocks_count: 1).destroy_all
  end

  def select_modified_blocks
    blocks.select { |block| block.content != block.edited_content }
  end

  def calculate_cost
    total = 0
    videos_id = []
    select_modified_blocks.each do |block|
      if block.edited_content != block.content
        block.videos.each do |video|
          if videos_id.include?(video.id) == false
            videos_id << video.id
            total += 1
          end
        end
      end
    end
    update(cost: total)
  end

  # @TODO : This method should be performed in a job
  def push_youtube
    # 1. Local video updating
    modified_blocks = blocks.select { |block| block.content != block.edited_content }
    modified_blocks.each do |block|
      block.videos.each do |video|
        video.update(edited_description: (video.description.gsub block.content, block.edited_content))
      end
    end

    # 2. Distant video updating
    account = Yt::Account.new refresh_token: user.channel.refresh_token
    videos.edited.each do |video|
      online_video = Yt::Video.new id: video.youtube_id, auth: account
      online_video.update(description: video.edited_description)
      video.update(description: video.edited_description) # @TODO : Can be replaced by a reload video after this method
      user.credit_rm(1)
    end

    # Last things
    update(state: "complete")
  end

end
