class Block < ApplicationRecord
  has_many    :video_blocks
  has_many    :videos, through: :video_blocks
end
