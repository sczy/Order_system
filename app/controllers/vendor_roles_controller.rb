class VendorRolesController < ApplicationController
  # GET /vendor_roles
  # GET /vendor_roles.json
  def index
    @vendor_roles = VendorRole.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vendor_roles }
    end
  end

  # GET /vendor_roles/1
  # GET /vendor_roles/1.json
  def show
    @vendor_role = VendorRole.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vendor_role }
    end
  end

  # GET /vendor_roles/new
  # GET /vendor_roles/new.json
  def new
    @vendor_role = VendorRole.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vendor_role }
    end
  end

  # GET /vendor_roles/1/edit
  def edit
    @vendor_role = VendorRole.find(params[:id])
  end

  # POST /vendor_roles
  # POST /vendor_roles.json
  def create
    @vendor_role = VendorRole.new(params[:vendor_role])

    respond_to do |format|
      if @vendor_role.save
        format.html { redirect_to @vendor_role, notice: 'Vendor role was successfully created.' }
        format.json { render json: @vendor_role, status: :created, location: @vendor_role }
      else
        format.html { render action: "new" }
        format.json { render json: @vendor_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vendor_roles/1
  # PUT /vendor_roles/1.json
  def update
    @vendor_role = VendorRole.find(params[:id])

    respond_to do |format|
      if @vendor_role.update_attributes(params[:vendor_role])
        # format.html { redirect_to @vendor_role, notice: 'Vendor role was successfully updated.' }
        format.html { redirect_to set_url}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vendor_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendor_roles/1
  # DELETE /vendor_roles/1.json
  def destroy
    @vendor_role = VendorRole.find(params[:id])
    # @vendor_role.destroy
    @vendor_role.vendor.destroy

    respond_to do |format|
      format.html { redirect_to vendor_roles_url }
      format.json { head :no_content }
    end
  end
end
