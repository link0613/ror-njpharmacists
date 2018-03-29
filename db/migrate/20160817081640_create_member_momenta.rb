class CreateMemberMomenta < ActiveRecord::Migration
  def change
    create_table :member_momenta do |t|
      t.string :name
      t.text :about_recognition
      t.datetime :momentum_date

      t.timestamps
    end
  end
end
