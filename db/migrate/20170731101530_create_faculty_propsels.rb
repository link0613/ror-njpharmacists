class CreateFacultyPropsels < ActiveRecord::Migration
  def change
    create_table :faculty_propsels do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :office_phone

      t.timestamps
    end
  end
end
