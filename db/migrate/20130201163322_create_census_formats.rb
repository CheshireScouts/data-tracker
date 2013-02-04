class CreateCensusFormats < ActiveRecord::Migration
  def change
    create_table :census_formats do |t|
      t.string :name
      t.string :table_xpath

      t.timestamps
    end
  end
end
