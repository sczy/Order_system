class VoteItemsController < ApplicationController
  # GET /vote_items
  # GET /vote_items.json
  def index
    @vote_items = VoteItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vote_items }
    end
  end

  # GET /vote_items/1
  # GET /vote_items/1.json
  def show
    @vote_item = VoteItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vote_item }
    end
  end

  # GET /vote_items/new
  # GET /vote_items/new.json
  def new
    @vote_item = VoteItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vote_item }
    end
  end

  # GET /vote_items/1/edit
  def edit
    @vote_item = VoteItem.find(params[:id])
  end

  # POST /vote_items
  # POST /vote_items.json
  def create
    @vote_item = VoteItem.new(params[:vote_item])

    respond_to do |format|
      if @vote_item.save
        format.html { redirect_to @vote_item, notice: 'Vote item was successfully created.' }
        format.json { render json: @vote_item, status: :created, location: @vote_item }
      else
        format.html { render action: "new" }
        format.json { render json: @vote_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vote_items/1
  # PUT /vote_items/1.json
  def update
    @vote_item = VoteItem.find(params[:id])

    respond_to do |format|
      if @vote_item.update_attributes(params[:vote_item])
        format.html { redirect_to @vote_item, notice: 'Vote item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vote_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vote_items/1
  # DELETE /vote_items/1.json
  def destroy
    @vote_item = VoteItem.find(params[:id])
    @vote_item.destroy

    respond_to do |format|
      format.html { redirect_to vote_items_url }
      format.json { head :no_content }
    end
  end
end
