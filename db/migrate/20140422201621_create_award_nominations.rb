class CreateAwardNominations < ActiveRecord::Migration
  def change
    create_table :award_nominations do |t|
      t.string :award_name
      t.string :nominator_name
      t.string :nominator_phone
      t.string :nominator_email
      t.string :nominee_name
      t.string :nominee_address
      t.string :nominee_phone
      t.string :nominee_email
      t.string :nominee_title

      t.timestamps
    end
  end
end
