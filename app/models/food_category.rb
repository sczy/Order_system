class FoodCategory < ActiveRecord::Base
  attr_accessible :category_id, :food_id
  belongs_to :category
  belongs_to :food
  
  def self.select_food_by_category(category_id)
    @foods = []
    FoodCategory.where("category_id=?",category_id).each do |foodcategory| 
      @food = foodcategory.food
      @foods << @food 
    end
    @foods.sort_by(&:vote_counter).reverse
  end
end
