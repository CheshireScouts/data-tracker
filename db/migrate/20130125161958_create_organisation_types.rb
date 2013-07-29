class CreateOrganisationTypes < ActiveRecord::Migration
  def change
    create_table :organisation_types do |t|
      t.string :name
      t.timestamps
    end
    add_index :organisation_types, :unique => true
  end
end
