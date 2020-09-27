class AddVideosBlocksCountToBlocks < ActiveRecord::Migration[6.0]
  def change
    add_column :blocks, :video_blocks_count, :integer, default: 0
  end
end
