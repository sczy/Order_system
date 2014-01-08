class CreateFoodCategories < ActiveRecord::Migration
  def change
    create_table :food_categories do |t|
      t.integer :food_id
      t.integer :categroy_id

      t.timestamps
    end
  end
end
