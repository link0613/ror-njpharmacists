class AddEvidenceToFacultyPropsels < ActiveRecord::Migration
  def change
    add_column :faculty_propsels, :evidence, :string
  end
end
