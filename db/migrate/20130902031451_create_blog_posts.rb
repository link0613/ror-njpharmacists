class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :post_title
      t.string :post_subtitle
      t.string :post_url_alias
      t.text :post_content
      t.references :blog

      t.timestamps
    end
    add_index :blog_posts, :blog_id
  end
end
