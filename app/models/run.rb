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

    # Remove blocks with only one video
    blocks.each do |block|
      block.destroy if block.videos.count == 1
    end

    blocks
  end

end
