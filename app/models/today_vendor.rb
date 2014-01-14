class TodayVendor < ActiveRecord::Base
  attr_accessible :vendor_id
  belongs_to :vendor
  
  def self.settodayvendor(vendor_id)
    TodayVendor.destroy_all
    TodayVendor.new(:vendor_id => vendor_id).save
  end
end
