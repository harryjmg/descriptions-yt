class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :trackable, :omniauthable,
         omniauth_providers: [:google_oauth2]

  serialize :name

  has_one :channel, :dependent => :destroy
  has_many :runs, :dependent => :destroy

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # users to be created if they don't exist
    unless user
        user = User.create(name: { first: data['first_name'], last: data['last_name'], full: data['name'] } ,
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end

    channel = Channel.where(name: data["name"]).first

    unless channel
      Channel.create(name: data["name"],
        access_token: access_token.credentials.token,
        refresh_token: access_token.credentials.refresh_token,
        user: user
      )
    end

    user
  end

end
