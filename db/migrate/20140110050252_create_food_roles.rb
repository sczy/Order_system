class CreateFoodRoles < ActiveRecord::Migration
  def change
    create_table :food_roles do |t|
      t.integer :food_id
      t.integer :role

      t.timestamps
    end
  end
end
