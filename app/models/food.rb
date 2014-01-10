class Food < ActiveRecord::Base
  default_scope :order => 'title'
  attr_accessible :image_url, :price, :title, :description, :remote_image_url_url
  
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png|jpeg)}i,
    :message => 'must be a URL for GIF, JPG, JPEG or PNG image.'
  }
  
  has_many :vote_items, :dependent => :destroy
  has_one :food_category, :dependent => :destroy
  has_one :food_vendor, :dependent => :destroy
  has_one :food_role, :dependent => :destroy
  mount_uploader :image_url, ImageUploader
  after_save :add_attribute

  def add_attribute
    if self.food_role.nil?
      self.food_role = FoodRole.new
      self.food_role.role = 0
      self.food_role.save!
    end
  end
  
  def vote_counter
    self.vote_items.count
  end
  
end
