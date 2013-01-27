class AddAncestryToOrganisations < ActiveRecord::Migration
  def self.up
    add_column :organisations, :ancestry, :string
    remove_column :organisations, :parent_id
    add_index :organisations, :ancestry
  end

  def self.down
  	remove_index :organisations, :ancestry
  	remove_column :organisations, :ancestry  	
  end
end