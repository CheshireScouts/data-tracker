class ScoutTypesController < ApplicationController
  # GET /scout_types
  # GET /scout_types.json
  def index
    @scout_types = ScoutType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scout_types }
    end
  end

  # GET /scout_types/1
  # GET /scout_types/1.json
  def show
    @scout_type = ScoutType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scout_type }
    end
  end

  # GET /scout_types/new
  # GET /scout_types/new.json
  def new
    @scout_type = ScoutType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scout_type }
    end
  end

  # GET /scout_types/1/edit
  def edit
    @scout_type = ScoutType.find(params[:id])
  end

  # POST /scout_types
  # POST /scout_types.json
  def create
    @scout_type = ScoutType.new(params[:scout_type])

    respond_to do |format|
      if @scout_type.save
        format.html { redirect_to @scout_type, notice: 'Scout type was successfully created.' }
        format.json { render json: @scout_type, status: :created, location: @scout_type }
      else
        format.html { render action: "new" }
        format.json { render json: @scout_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scout_types/1
  # PUT /scout_types/1.json
  def update
    @scout_type = ScoutType.find(params[:id])

    respond_to do |format|
      if @scout_type.update_attributes(params[:scout_type])
        format.html { redirect_to @scout_type, notice: 'Scout type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scout_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scout_types/1
  # DELETE /scout_types/1.json
  def destroy
    @scout_type = ScoutType.find(params[:id])
    @scout_type.destroy

    respond_to do |format|
      format.html { redirect_to scout_types_url }
      format.json { head :no_content }
    end
  end
end
