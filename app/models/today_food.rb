class TodayFood < ActiveRecord::Base
  attr_accessible :food_id
  belongs_to :food
  
  def self.timetask_start
    settodayfoods
    TodayFood.delay(run_at: 30.minutes.from_now).timetask_stop
     # TodayFood.delay(run_at: 2.hours.from_now).timetask_stop
  end
  def self.timetask_stop
    TodayFood.destroy_all
  end
  
  def self.settodayfoods
    TodayFood.destroy_all
    @todayvendor_id = TodayVendor.first.vendor_id
    @foods = FoodVendor.select_food_by_vendor(@todayvendor_id)
    if @foods
        @foods.each do |food|
        TodayFood.new(:food_id => food.id).save;
      end
    end
  end
  
  def self.gettodayfoods
    @todayfoods = TodayFood.all
    @foods = []
    @todayfoods.each do |todayfood|
        @food = todayfood.food
        @foods << @food 
      end
      @foods
  end
end
