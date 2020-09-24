Yt.configure do |config|
  config.client_id = Rails.application.credentials.google[:client_id]
  config.client_secret = Rails.application.credentials.google[:client_secret]
end
