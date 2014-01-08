class RenameCategroyIdToCategoryId < ActiveRecord::Migration
  def up
    rename_column :food_categories, :categroy_id, :category_id
  end

  def down
    rename_column :food_categories, :category_id, :categroy_id
  end
end
