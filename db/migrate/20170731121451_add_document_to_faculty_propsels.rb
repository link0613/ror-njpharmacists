class AddDocumentToFacultyPropsels < ActiveRecord::Migration
  def change
    add_column :faculty_propsels, :document, :string
  end
end
