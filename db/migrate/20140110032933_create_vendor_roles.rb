class CreateVendorRoles < ActiveRecord::Migration
  def change
    create_table :vendor_roles do |t|
      t.integer :vendor_id
      t.integer :role

      t.timestamps
    end
  end
end
