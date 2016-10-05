class AddAttachmentBlogImgToBlogs < ActiveRecord::Migration
  def self.up
    change_table :blogs do |t|
      t.attachment :blog_img
    end
  end

  def self.down
    remove_attachment :blogs, :blog_img
  end
end
