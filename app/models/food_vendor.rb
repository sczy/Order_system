class FoodVendor < ActiveRecord::Base
  attr_accessible :food_id, :vendor_id
  belongs_to :vendor
  belongs_to :food
  
  def self.select_food_by_vendor(vendor_id)
    @foods = []
    FoodVendor.where("vendor_id=?",vendor_id).each do |foodvendor| 
      @food = foodvendor.food
      @foods << @food 
    end
    @foods
  end
  
end
