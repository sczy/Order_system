class Vendor < ActiveRecord::Base
  attr_accessible :title
  has_many :food_vendors
end
