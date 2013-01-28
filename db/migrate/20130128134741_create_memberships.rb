class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :organisation
      t.references :year
      t.string :gender
      t.string :membership_type
      t.integer :head_count

      t.timestamps
    end
    add_index :memberships, :organisation_id
    add_index :memberships, :year_id
  end
end
