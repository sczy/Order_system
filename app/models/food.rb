class Food < ActiveRecord::Base
  default_scope :order => 'title'
  attr_accessible :image_url, :price, :title, :description
  has_many :vote_items
end
