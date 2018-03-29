class AddInterestedMemberToFacultyPropsel < ActiveRecord::Migration
  def change
  	add_column :faculty_propsels, :intrested_memeber, :string
  end
end
