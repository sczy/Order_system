class SetController < ApplicationController
  def index
    @user_roles = UserRole.all
    @vendor_roles = VendorRole.all
    @food_roles = FoodRole.all
    @vendors = Vendor.all
    @vendor = nil
    
    if params[:vendor_role]
      @vendor_role = VendorRole.find(params[:vendor_role])
      @vendor_role.role = params[:role]
      @vendor_role.save
      @vendor = @vendor_role.vendor
    end
    
    if params[:food_role]
      @food_role = FoodRole.find(params[:food_role])
      @food_role.role = params[:role]
      @food_role.save
      @vendor = @food_role.food.food_vendor.vendor
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
    
  end
end
