class CreateChannels < ActiveRecord::Migration[6.0]
  def change
    create_table :channels do |t|

      t.string      :name
      t.string      :access_token
      t.string      :refresh_token
      t.references  :user

      t.timestamps
    end
  end
end
