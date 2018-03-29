class AddOrderNumToPages < ActiveRecord::Migration
  def change
    add_column :pages, :order_num, :integer, default: 0
  end
end
