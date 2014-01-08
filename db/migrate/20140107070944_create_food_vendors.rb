class CreateFoodVendors < ActiveRecord::Migration
  def change
    create_table :food_vendors do |t|
      t.integer :food_id
      t.integer :vendor_id

      t.timestamps
    end
  end
end
