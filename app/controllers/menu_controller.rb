class MenuController < ApplicationController
  # skip_before_filter :authorize_amin
  def index
    # raise params.to_yaml
    if params[:category_id]
      @foods = FoodCategory.select_food_by_category(params[:category_id])
    else
      @foods = Food.all
    end
    @categories = Category.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.js 
    end
  end
end
