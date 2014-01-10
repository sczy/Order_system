class FoodRole < ActiveRecord::Base
  attr_accessible :food_id, :role
  belongs_to :food
  
  def self.select_food_by_role(role)
    @foods = []
    FoodRole.where("role=?",role).each do |foodrole| 
      @food = foodrole.food
      @foods << @food
    end
    @foods
  end
end
