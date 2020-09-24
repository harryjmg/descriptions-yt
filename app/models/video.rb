class Video < ApplicationRecord
  belongs_to  :channel
  has_many    :video_blocks
  has_many    :blocks, through: :video_blocks
end
