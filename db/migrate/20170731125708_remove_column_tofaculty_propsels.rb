class RemoveColumnTofacultyPropsels < ActiveRecord::Migration
  def change
  	 remove_column :faculty_propsels, :document, :string
  end
end
