class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name
      t.references :organisation_type

      t.timestamps
    end
    add_index :organisations, :organisation_type_id
  end
end
