class VoteItem < ActiveRecord::Base
  attr_accessible :food_id, :user_id, :food
  belongs_to :user
  belongs_to :food
  
  def counter
    self.food.vote_items.count
  end
  
  def self.clear
    VoteItem.destroy_all
  end
end
