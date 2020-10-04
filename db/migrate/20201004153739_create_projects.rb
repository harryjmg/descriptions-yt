class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :project_url
      t.datetime :last_updated
      t.integer :progression_percent

      t.timestamps
    end
  end
end
