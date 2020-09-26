class Channel < ApplicationRecord
  belongs_to :user
  has_many :videos, dependent: :destroy

  def load_videos
    account = Yt::Account.new refresh_token: refresh_token
    account.videos.each do |v|
      video = videos.find_or_initialize_by(youtube_id: v.id)
      video.update(
        title: v.title,
        description: v.description,
        miniature: v.thumbnail_url,
        published_at: v.published_at
      )
    end
  end
end
