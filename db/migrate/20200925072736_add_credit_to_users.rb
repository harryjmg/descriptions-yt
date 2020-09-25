class AddCreditToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :credit, :integer
  end
end
