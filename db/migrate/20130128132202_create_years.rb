class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.integer :name
      t.references :census_format
      t.timestamps
    end
  end
end
