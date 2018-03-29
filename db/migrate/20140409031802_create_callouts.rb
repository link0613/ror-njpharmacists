class CreateCallouts < ActiveRecord::Migration
  def change
    create_table :callouts do |t|
      t.string :callout_title
      t.text :callout_content

      t.timestamps
    end
  end
end
