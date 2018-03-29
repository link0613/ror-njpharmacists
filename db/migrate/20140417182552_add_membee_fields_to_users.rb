class AddMembeeFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :roles, :string
    add_column :users, :membee_id, :string
  end
end
