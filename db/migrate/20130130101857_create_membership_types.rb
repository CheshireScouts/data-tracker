class CreateMembershipTypes < ActiveRecord::Migration
  def change
    create_table :membership_types do |t|
      t.string :code
      t.string :name
      t.timestamps
    end
    add_index :membership_types, :code, :unique => true
  end
end
