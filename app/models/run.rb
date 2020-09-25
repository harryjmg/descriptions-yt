class Run < ApplicationRecord
  belongs_to :user

  has_many :videos
  has_many :blocks
end
