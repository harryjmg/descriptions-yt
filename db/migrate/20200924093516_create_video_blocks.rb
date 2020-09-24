class CreateVideoBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :video_blocks do |t|
      t.references :block, null: false, foreign_key: true
      t.references :video, null: false, foreign_key: true

      t.timestamps
    end
  end
end
