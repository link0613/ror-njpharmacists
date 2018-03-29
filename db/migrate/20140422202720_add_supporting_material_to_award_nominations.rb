class AddSupportingMaterialToAwardNominations < ActiveRecord::Migration
  def self.up
    add_attachment :award_nominations, :supporting_material
  end

  def self.down
    remove_attachment :award_nominations, :supporting_material
  end
end
