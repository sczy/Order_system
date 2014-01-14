class CreateTodayFoods < ActiveRecord::Migration
  def change
    create_table :today_foods do |t|
      t.integer :food_id

      t.timestamps
    end
  end
end
