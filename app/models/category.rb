class Category < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :title
  validates :title, :presence => true
  has_many :food_categories, :dependent => :destroy
end
