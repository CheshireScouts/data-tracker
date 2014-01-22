class CreateScoutTypes < ActiveRecord::Migration
  def change
    create_table :scout_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
