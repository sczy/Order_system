class PrepareController < ApplicationController
  def index
    respond_to do |format|
            if TodayFood.all.size == 0
                if VoteItem.all.size !=0
                  format.html { redirect_to result_url }
                else
                  format.html # index.html.erb
                end
            else
              format.html { redirect_to menu_url }
            end
      end
  end
end
