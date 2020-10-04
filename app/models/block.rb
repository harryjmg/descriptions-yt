class Block < ApplicationRecord
  belongs_to  :run

  has_many    :video_blocks, :dependent => :destroy
  has_many    :videos, through: :video_blocks

  before_create :initialize_edited_content
  before_update :clean_edited_content_new_lines

  private

  def initialize_edited_content
    self.edited_content = self.content
  end

  def clean_edited_content_new_lines
    self.edited_content = self.edited_content.gsub("\r\n", "\n")
  end
end
