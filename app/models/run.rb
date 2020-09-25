class Run < ApplicationRecord
  belongs_to :user

  has_many :blocks

  has_many :video_runs
  has_many :videos, through: :video_runs
end
