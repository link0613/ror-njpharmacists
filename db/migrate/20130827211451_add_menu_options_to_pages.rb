class AddMenuOptionsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :include_in_header_menu, :boolean
    add_column :pages, :include_in_footer_menu, :boolean
  end
end
