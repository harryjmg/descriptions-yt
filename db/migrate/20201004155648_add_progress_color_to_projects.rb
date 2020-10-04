class AddProgressColorToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :progress_color, :string
  end
end
