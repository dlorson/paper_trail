class AddObjectChangesColumnToModifications < ActiveRecord::Migration
  def self.up
    add_column :modifications, :object_changes, :text
  end

  def self.down
    remove_column :modifications, :object_changes
  end
end
