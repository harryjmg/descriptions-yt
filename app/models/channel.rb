class Channel < ApplicationRecord
  belongs_to :user
  has_many :videos, dependent: :destroy

  def load_videos
    account = Yt::Account.new refresh_token: refresh_token
    account.videos.each do |v|
      videos.create(
        youtube_id: v.id,
        title: v.title,
        description: v.description,
        miniature: v.thumbnail_url
      )
    end
  end
end
