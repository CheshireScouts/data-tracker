class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.references :organisation
      t.references :year
      t.references :award_type
      t.references :scout_type
      t.integer :award_count

      t.timestamps
    end
    add_index :awards, :organisation_id
    add_index :awards, :year_id
    add_index :awards, :award_type_id
    add_index :awards, :scout_type_id
  end
end
