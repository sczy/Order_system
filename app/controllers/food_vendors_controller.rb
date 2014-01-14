class FoodVendorsController < ApplicationController
  # GET /food_vendors
  # GET /food_vendors.json
  def index
    @food_vendors = FoodVendor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @food_vendors }
    end
  end

  # GET /food_vendors/1
  # GET /food_vendors/1.json
  def show
    @food_vendor = FoodVendor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @food_vendor }
    end
  end

  # GET /food_vendors/new
  # GET /food_vendors/new.json
  def new
    @food_vendor = FoodVendor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @food_vendor }
    end
  end

  # GET /food_vendors/1/edit
  def edit
    @food_vendor = FoodVendor.find(params[:id])
  end

  # POST /food_vendors
  # POST /food_vendors.json
  def create
    @food_vendor = FoodVendor.new(params[:food_vendor])

    respond_to do |format|
      if @food_vendor.save
        format.html { redirect_to @food_vendor, notice: 'Food vendor was successfully created.' }
        format.json { render json: @food_vendor, status: :created, location: @food_vendor }
      else
        format.html { render action: "new" }
        format.json { render json: @food_vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /food_vendors/1
  # PUT /food_vendors/1.json
  def update
    @food_vendor = FoodVendor.find(params[:id])

    respond_to do |format|
      if @food_vendor.update_attributes(params[:food_vendor])
        format.html { redirect_to @food_vendor, notice: 'Food vendor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @food_vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_vendors/1
  # DELETE /food_vendors/1.json
  def destroy
    @food_vendor = FoodVendor.find(params[:id])
    # @food_vendor.destroy
    if @food_vendor.food
      @food_vendor.food.destroy
    end

    respond_to do |format|
      format.html { redirect_to food_vendors_url }
      format.json { head :no_content }
    end
  end
end
