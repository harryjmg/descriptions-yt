class Video < ApplicationRecord
  belongs_to  :channel

  has_many    :video_blocks, dependent: :destroy
  has_many    :blocks, through: :video_blocks

  has_many    :video_runs, dependent: :destroy
  has_many    :runs, through: :video_runs
end
