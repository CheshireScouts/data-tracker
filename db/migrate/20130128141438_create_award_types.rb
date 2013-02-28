class CreateAwardTypes < ActiveRecord::Migration
  def change
    create_table :award_types do |t|
      t.string :code
      t.string :name
      t.references :scout_type
      t.timestamps
    end
    add_index :award_types, :code, :unique => true
    add_index :award_types, :scout_type_id
  end
end
