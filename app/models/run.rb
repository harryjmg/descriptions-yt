class Run < ApplicationRecord
  belongs_to :user

  has_many :blocks, :dependent => :destroy

  has_many :video_runs
  has_many :videos, through: :video_runs

  def generate_blocks
    videos.each do |v|
      parts = v.description.split("\n\n")
      parts.each do |p|
        new_block = blocks.where(content: p).first
        if new_block.nil?
          new_block = blocks.create(content: p)
        end
        new_block.videos << v
      end
    end

    blocks
  end

  def select_recurrent_blocks
    blocks.select { |block| block.videos.count != 1 }
    # blocks.select { &:videos.count != 1 }
  end

  def select_modified_blocks
    filter_1 = select_recurrent_blocks
    filter_1.select { |block| block.content != block.edited_content }
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

  def push_youtube
    # Local video updating
    blocks.each do |block|
      if block.edited_content.present? && block.edited_content != block.content
        block.videos.each do |video|
          video.update(edited_description: (video.description.gsub block.content, block.edited_content))
        end
      end
    end

    # Distant video updating
    account = Yt::Account.new refresh_token: user.channel.refresh_token
    videos.edited.each do |video|
      online_video = Yt::Video.new id: video.youtube_id, auth: account
      online_video.update(description: video.edited_description)
      user.credit_rm(1)
    end

    # Last things
    update(state: "complete")
  end

end
