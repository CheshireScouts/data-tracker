class CreateCensusTableFormats < ActiveRecord::Migration
  def change
    create_table :census_table_formats do |t|
      t.references :census_format
      t.references :scout_type
      t.references :membership_type
      t.integer :row
      t.integer :column

      t.timestamps
    end
    add_index :census_table_formats, :census_format_id
    add_index :census_table_formats, :scout_type_id
    add_index :census_table_formats, :membership_type_id
  end
end
