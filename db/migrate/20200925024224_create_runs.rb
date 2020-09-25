class CreateRuns < ActiveRecord::Migration[6.0]
  def change
    create_table :runs do |t|
      t.string :state
      t.integer :cost
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
