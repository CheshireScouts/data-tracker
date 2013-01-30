class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :organisation
      t.references :year
      t.references :membership_type
      t.string :gender
      t.integer :head_count
      t.timestamps
    end
    add_index :memberships, :organisation_id
    add_index :memberships, :year_id
    add_index :memberships, :membership_type_id
  end
end
