class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.text :youtube_id
      t.string :title
      t.text :description
      t.string :miniature
      t.text :edited_descriptions
      t.references :channel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
