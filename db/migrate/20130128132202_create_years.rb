class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.integer :name
      t.references :group_census_format, :class_name => "CensusFormat"
      t.references :district_census_format, :class_name => "CensusFormat"
      t.timestamps
    end
  end
end
