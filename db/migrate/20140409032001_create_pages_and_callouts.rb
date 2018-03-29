class CreatePagesAndCallouts < ActiveRecord::Migration
  def change
    create_table :callouts_pages do |t|
    	t.belongs_to :page
    	t.belongs_to :callout
    end
  end
end
