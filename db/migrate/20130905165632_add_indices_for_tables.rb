class AddIndicesForTables < ActiveRecord::Migration
  def up
      add_index :pages, :url_alias
      add_index :blogs, :blog_url_alias
      add_index :blog_posts, :post_url_alias
  end

  def down
      remove_index :pages, :url_alias
      remove_index :blogs, :blog_url_alias
      remove_index :blog_posts, :post_url_alias
  end
end
