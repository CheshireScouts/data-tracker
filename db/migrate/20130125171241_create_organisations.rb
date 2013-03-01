class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :registration_no
      t.string :census_url_no
      t.string :name
      t.string :status
      t.references :organisation_type
      t.references :parent, :class_name => "Organisation"
      t.timestamps
    end
    add_index :organisations, :registration_no, :unique => true
    add_index :organisations, :organisation_type_id
    add_index :organisations, :status
  end
end
