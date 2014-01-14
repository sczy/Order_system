class Vendor < ActiveRecord::Base
  attr_accessible :title
  validates :title, :presence => true
  has_one :vendor_role, :dependent => :destroy
  has_many :food_vendors, :dependent => :destroy
  after_save :add_attribute
  
  def add_attribute
    if self.vendor_role.nil?
      self.vendor_role = VendorRole.new
      self.vendor_role.role = 0
      self.vendor_role.save!
    end
  end
end
