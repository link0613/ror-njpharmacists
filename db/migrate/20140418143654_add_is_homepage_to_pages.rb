class AddIsHomepageToPages < ActiveRecord::Migration
  def change
    add_column :pages, :is_homepage, :boolean
  end
end
