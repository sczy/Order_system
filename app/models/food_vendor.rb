class FoodVendor < ActiveRecord::Base
  attr_accessible :food_id, :vendor_id
  belongs_to :vendor
  belongs_to :food
end
