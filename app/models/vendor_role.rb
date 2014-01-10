class VendorRole < ActiveRecord::Base
  attr_accessible :role, :vendor_id
  belongs_to :vendor
  
  def self.select_vendor_by_role(role)
    @vendors = []
    VendorRole.where("role=?",role).each do |vendorrole| 
      @vendor = vendorrole.vendor
      @vendors << @vendor 
    end
    @vendors
  end
end
