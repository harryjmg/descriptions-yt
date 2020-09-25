class CreateVideoRuns < ActiveRecord::Migration[6.0]
  def change
    create_table :video_runs do |t|
      t.references :video, null: false, foreign_key: true
      t.references :run, null: false, foreign_key: true

      t.timestamps
    end
  end
end
