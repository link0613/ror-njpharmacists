class AddRedirectToPages < ActiveRecord::Migration
  def change
    add_column :pages, :is_redirect, :boolean
    add_column :pages, :redirect_url, :string
  end
end
