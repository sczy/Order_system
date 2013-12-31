class MenuController < ApplicationController
  def index
    @foods = Food.all
  end
end
