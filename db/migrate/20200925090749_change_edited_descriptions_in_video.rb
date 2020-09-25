class ChangeEditedDescriptionsInVideo < ActiveRecord::Migration[6.0]
  def change
    rename_column :videos, :edited_descriptions, :edited_description
  end
end
