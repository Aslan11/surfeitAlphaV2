class StashesController < ApplicationController


  # GET /stashes
  # GET /stashes.json
  def index
    @stashes = Stash.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stashes }
    end
  end

  # GET /stashes/1
  # GET /stashes/1.json
  def show
    @stash = Stash.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stash }
    end
  end

  # GET /stashes/new
  # GET /stashes/new.json
  def new
    @stash = Stash.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stash }
    end
  end

  # GET /stashes/1/edit
  def edit
    @stash = Stash.find(params[:id])
  end

  # POST /stashes
  # POST /stashes.json
  def create
    @stash = Stash.new(params[:stash])

    respond_to do |format|
      if @stash.save
        format.html { redirect_to @stash, notice: 'Stash was successfully created.' }
        format.json { render json: @stash, status: :created, location: @stash }
      else
        format.html { render action: "new" }
        format.json { render json: @stash.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stashes/1
  # PUT /stashes/1.json
  def update
    @stash = Stash.find(params[:id])

    respond_to do |format|
      if @stash.update_attributes(params[:stash])
        format.html { redirect_to @stash, notice: 'Stash was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stashes/1
  # DELETE /stashes/1.json
  def destroy
    @stash = Stash.find(params[:id])
    @stash.destroy

    respond_to do |format|
      format.html { redirect_to stashes_url }
      format.json { head :no_content }
    end
  end
end
