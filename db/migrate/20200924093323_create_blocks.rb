class CreateBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :blocks do |t|
      t.text :content
      t.text :edited_content

      t.timestamps
    end
  end
end
