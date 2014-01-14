class FoodRolesController < ApplicationController
  # GET /food_roles
  # GET /food_roles.json
  def index
    @food_roles = FoodRole.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @food_roles }
    end
  end

  # GET /food_roles/1
  # GET /food_roles/1.json
  def show
    @food_role = FoodRole.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @food_role }
    end
  end

  # GET /food_roles/new
  # GET /food_roles/new.json
  def new
    @food_role = FoodRole.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @food_role }
    end
  end

  # GET /food_roles/1/edit
  def edit
    @food_role = FoodRole.find(params[:id])
  end

  # POST /food_roles
  # POST /food_roles.json
  def create
    @food_role = FoodRole.new(params[:food_role])

    respond_to do |format|
      if @food_role.save
        format.html { redirect_to @food_role, notice: 'Food role was successfully created.' }
        format.json { render json: @food_role, status: :created, location: @food_role }
      else
        format.html { render action: "new" }
        format.json { render json: @food_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /food_roles/1
  # PUT /food_roles/1.json
  def update
    @food_role = FoodRole.find(params[:id])

    respond_to do |format|
      if @food_role.update_attributes(params[:food_role])
        format.html { redirect_to @food_role, notice: 'Food role was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @food_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_roles/1
  # DELETE /food_roles/1.json
  def destroy
    @food_role = FoodRole.find(params[:id])
    @vendor = @food_role.food.food_vendor.vendor
    @food_role.food.destroy
    # @food_role.destroy

    respond_to do |format|
      format.html { redirect_to food_roles_url }
      format.json { head :no_content }
      format.js
    end
  end
end
