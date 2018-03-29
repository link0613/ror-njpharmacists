class AddTellUsWhyToAwardNominations < ActiveRecord::Migration
  def change
    add_column :award_nominations, :reason_for_nomination, :text
  end
end
