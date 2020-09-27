class VideoBlock < ApplicationRecord
  belongs_to :block, counter_cache: true
  belongs_to :video
end
