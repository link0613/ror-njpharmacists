class AddMembersOnlyFieldToPages < ActiveRecord::Migration
  def change
    add_column :pages, :is_members_only, :boolean
  end
end
