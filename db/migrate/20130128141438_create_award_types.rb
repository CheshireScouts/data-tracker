class CreateAwardTypes < ActiveRecord::Migration
  def change
    create_table :award_types do |t|
      t.string :code
      t.string :name
      t.timestamps
    end
    add_index :award_types, :code, :unique => true
  end
end
