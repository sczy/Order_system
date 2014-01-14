class FoodsController < ApplicationController
  # GET /foods
  # GET /foods.json
  before_filter :authorize_amin
  def index
    @foods = Food.all
    @foods = Food.paginate :page=>params[:page], :order =>'created_at asc',
    :per_page=>9
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @foods }
    end
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
    @food = Food.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @food }
    end
  end

  # GET /foods/new
  # GET /foods/new.json
  def new
    @food = Food.new
    # @category = Category.all
    @vendors = VendorRole.select_vendor_by_role(0)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @food }
    end
  end

  # GET /foods/1/edit
  def edit
    @vendors = VendorRole.select_vendor_by_role(0)
    @food = Food.find(params[:id])
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(params[:food])
    # @food.category << Category.find(params[:category])
     # @food.food_category = FoodCategory.find(params[:category])

     @category = Category.find(params[:category])
     @food.food_category = FoodCategory.new(:category_id => @category.id);
     
     @vendor = Vendor.find(params[:vendor])
     @food.food_vendor = FoodVendor.new(:vendor_id => @vendor.id);
     
    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_url}
        format.json { render json: @food, status: :created, location: @food }
      else
        format.html { render action: "new" }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /foods/1
  # PUT /foods/1.json
  def update
    @food = Food.find(params[:id])
    
    @category = Category.find(params[:category])
    @vendor = Vendor.find(params[:vendor])
    
    respond_to do |format|
      if @food.update_attributes(params[:food]) && @food.food_category.update_attributes(:category_id => @category.id) && @food.food_vendor.update_attributes(:vendor_id => @vendor.id)
        format.html { redirect_to foods_url}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url }
      format.json { head :no_content }
    end
  end
end
