class AddProgressCommentToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :progress_comment, :string
  end
end
