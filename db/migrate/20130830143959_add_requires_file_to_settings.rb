class AddRequiresFileToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :requires_file, :boolean
  end
end
