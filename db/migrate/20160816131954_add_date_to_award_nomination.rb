class AddDateToAwardNomination < ActiveRecord::Migration
  def change
    add_column :award_nominations, :award_date, :datetime
  end
end
