class SetController < ApplicationController
  def index
    @user_roles = UserRole.all
    @vendor_roles = VendorRole.all
    @food_roles = FoodRole.all
  end
end
