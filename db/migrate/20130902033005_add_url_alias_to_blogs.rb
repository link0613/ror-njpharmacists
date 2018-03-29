class AddUrlAliasToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :blog_url_alias, :string
  end
end
