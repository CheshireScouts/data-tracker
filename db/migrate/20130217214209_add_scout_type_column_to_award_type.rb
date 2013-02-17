class AddScoutTypeColumnToAwardType < ActiveRecord::Migration
  def change
    add_column :award_types, :scout_type_id, :integer
    add_index :award_types, :scout_type_id
  end
end
