class AddColumnToFacultyProposels < ActiveRecord::Migration
  def change
    add_column :faculty_propsels, :area_of_expertise, :string
    add_column :faculty_propsels, :limitations, :string
    add_column :faculty_propsels, :program_title, :string
    add_column :faculty_propsels, :area, :string
    add_column :faculty_propsels, :program_length, :string
    add_column :faculty_propsels, :activity_based, :string
    add_column :faculty_propsels, :brief_summary, :string
  end
end
