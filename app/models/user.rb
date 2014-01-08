class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_one :user_role
  has_many :vote_items, :dependent => :destroy
  after_save :add_attribute
  
  def add_attribute
    if self.user_role.nil?
      self.user_role = UserRole.new
      self.user_role.role = 1
      self.user_role.save!
    end
  end
  
  def vote_food(food_id)
    current_item = self.vote_items.find_by_food_id(food_id)
    if current_item
      current_item
    else
      current_item = self.vote_items.build(:food_id => food_id)
    end
    current_item
  end
end
