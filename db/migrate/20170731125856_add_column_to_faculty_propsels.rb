class AddColumnToFacultyPropsels < ActiveRecord::Migration
  def change
			 add_column :faculty_propsels, :avatar_file_name, :string
			 add_column :faculty_propsels, :avatar_content_type, :string
			 add_column :faculty_propsels, :avatar_file_size, :integer
			 add_column :faculty_propsels, :avatar_updated_at, :datetime
  end
end
