class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :page_title
      t.string :url_alias
      t.references :template
      t.string :meta_keywords
      t.string :meta_description
      t.text :page_content
      t.references :parent_page

      t.timestamps
    end
    add_index :pages, :template_id
    add_index :pages, :parent_page_id
  end
end
