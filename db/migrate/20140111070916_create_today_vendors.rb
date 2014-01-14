class CreateTodayVendors < ActiveRecord::Migration
  def change
    create_table :today_vendors do |t|
      t.integer :vendor_id

      t.timestamps
    end
  end
end
