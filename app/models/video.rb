class Video < ApplicationRecord
  belongs_to  :channel

  has_many    :video_blocks
  has_many    :blocks, through: :video_blocks

  has_many    :video_runs
  has_many    :runs, through: :video_runs
end
