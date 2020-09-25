class AddRunIdToBlocks < ActiveRecord::Migration[6.0]
  def change
    add_reference :blocks, :run, null: false, foreign_key: true
  end
end
