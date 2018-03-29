class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :setting_name
      t.string :setting_value
      t.string :setting_attachment_file_name

      t.timestamps
    end
    
    add_index :settings, :setting_name
  end
end
