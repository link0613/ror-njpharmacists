class AddEmailFieldToMemberMomenta < ActiveRecord::Migration
  def change
  	add_column :member_momenta, :email, :string
  	add_column :member_momenta, :member_attachment_file_name, :string
  end
end
