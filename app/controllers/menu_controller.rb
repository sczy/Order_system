class MenuController < ApplicationController
  # skip_before_filter :authorize_amin
  def index
    # raise params.to_yaml
    if params[:vendor_id]
      TodayVendor.settodayvendor(params[:vendor_id])
      # TodayFood.settodayfoods
    end

    if params[:category_id]
      @foods = FoodCategory.select_food_by_category(params[:category_id])
      @foods = TodayFood.gettodayfoods & @foods
    else
      @foods = TodayFood.gettodayfoods
    end
     
    @foods =  @foods - FoodRole.select_food_by_role(1)
    @categories = Category.all
    @vendors = VendorRole.select_vendor_by_role(0)
    
    respond_to do |format|
      if current_user.admin?
        format.html # index.html.erb
      else
        if TodayFood.all.size != 0
          format.html # index.html.erb
        else 
          if VoteItem.all.size !=0
            format.html { redirect_to result_url }
          else
            format.html { redirect_to prepare_url }
          end
        end
      end
      format.js 
    end
  end
end
