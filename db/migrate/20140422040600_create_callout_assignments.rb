class CreateCalloutAssignments < ActiveRecord::Migration
  def change
    create_table :callout_assignments do |t|
      t.references :page, index: true
      t.references :callout, index: true
      t.integer :order_num, default: 0
    end
  end
end
