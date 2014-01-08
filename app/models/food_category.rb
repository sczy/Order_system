class FoodCategory < ActiveRecord::Base
  attr_accessible :category_id, :food_id
  belongs_to :category
  belongs_to :food
end
