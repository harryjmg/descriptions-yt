class AddAvatarUrlToChannel < ActiveRecord::Migration[6.0]
  def change
    add_column :channels, :avatar_url, :string
  end
end
