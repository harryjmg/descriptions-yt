class Block < ApplicationRecord
  belongs_to  :run

  has_many    :video_blocks, :dependent => :destroy
  has_many    :videos, through: :video_blocks
end
