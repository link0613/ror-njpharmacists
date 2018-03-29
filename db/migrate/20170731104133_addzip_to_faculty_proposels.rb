class AddzipToFacultyProposels < ActiveRecord::Migration
  def change
    add_column :faculty_propsels, :state, :string
    add_column :faculty_propsels, :zip, :string
    add_column :faculty_propsels, :mobile_phone, :string
  end
end
