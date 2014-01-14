class ResultController < ApplicationController
  def index
    @vote_items = VoteItem.all
    @todayvendor_id = TodayVendor.first.vendor_id
    @todayfoods = FoodVendor.select_food_by_vendor(@todayvendor_id)
    # @todayfoods = TodayFood.gettodayfoods
    @foods = Food.all.sort_by(&:vote_counter).reverse & @todayfoods
    @foods =  @foods - FoodRole.select_food_by_role(1)
   
    respond_to do |format|
        if current_user.admin?
          format.html # index.html.erb
        else
            if VoteItem.all.size != 0 && TodayFood.all.size ==0
              format.html # index.html.erb
            else
                if TodayFood.all.size !=0
                  format.html { redirect_to prepare_url }
                else
                  format.html { redirect_to menu_url }
                end
            end
        end
      end
  end
end
