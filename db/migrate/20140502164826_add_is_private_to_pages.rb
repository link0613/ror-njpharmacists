class AddIsPrivateToPages < ActiveRecord::Migration
  def change
    add_column :pages, :is_private, :boolean, default: false
  end
end
