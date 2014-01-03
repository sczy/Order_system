class MenuController < ApplicationController
  # skip_before_filter :authorize_amin
  def index
    @foods = Food.all.to_a.sort_by(&:vote_counter).reverse
  end
end
