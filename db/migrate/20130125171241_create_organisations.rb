class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name
      t.references :organisation_type
      t.references :parent, :class_name => "Organisation"
      t.timestamps
    end
    add_index :organisations, :organisation_type_id
  end
end
