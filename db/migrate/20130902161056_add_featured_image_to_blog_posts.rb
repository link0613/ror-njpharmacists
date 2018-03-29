class AddFeaturedImageToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :featured_image_file_name, :string
  end
end
