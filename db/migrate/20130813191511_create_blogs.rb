class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :blog_title
      t.string :blog_tag_name

      t.timestamps
    end
  end
end
