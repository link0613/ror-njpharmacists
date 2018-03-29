class ChangeSettingValueToText < ActiveRecord::Migration
  def up
  	change_column :settings, :setting_value, :text
  end

  def down
  	change_column :settings, :setting_value, :string
  end
end
