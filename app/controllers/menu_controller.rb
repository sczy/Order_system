class MenuController < ApplicationController
  # skip_before_filter :authorize_amin
  def index
    @foods = Food.all.to_a.sort_by(&:vote_counter).reverse
    @foods = Food.all
    @categories = Category.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.js {
        @category = Category.find(params[:category_id]);
        @foods.each do |food|
          if food.food_category.category_id == @category.id
            foods << fd
          else
            
          end
        end
      }
    end
  end
end
