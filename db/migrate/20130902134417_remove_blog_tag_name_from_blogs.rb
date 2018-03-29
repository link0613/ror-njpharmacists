class RemoveBlogTagNameFromBlogs < ActiveRecord::Migration
  def up
    remove_column :blogs, :blog_tag_name
  end

  def down
    add_column :blogs, :blog_tag_name, :string
  end
end
