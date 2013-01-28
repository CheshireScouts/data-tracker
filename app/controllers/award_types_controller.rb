class AwardTypesController < ApplicationController
  load_and_authorize_resource
  # GET /award_types
  # GET /award_types.json
  def index
    @award_types = AwardType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @award_types }
    end
  end

  # GET /award_types/1
  # GET /award_types/1.json
  def show
    @award_type = AwardType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @award_type }
    end
  end

  # GET /award_types/new
  # GET /award_types/new.json
  def new
    @award_type = AwardType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @award_type }
    end
  end

  # GET /award_types/1/edit
  def edit
    @award_type = AwardType.find(params[:id])
  end

  # POST /award_types
  # POST /award_types.json
  def create
    @award_type = AwardType.new(params[:award_type])

    respond_to do |format|
      if @award_type.save
        format.html { redirect_to @award_type, notice: 'Award type was successfully created.' }
        format.json { render json: @award_type, status: :created, location: @award_type }
      else
        format.html { render action: "new" }
        format.json { render json: @award_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /award_types/1
  # PUT /award_types/1.json
  def update
    @award_type = AwardType.find(params[:id])

    respond_to do |format|
      if @award_type.update_attributes(params[:award_type])
        format.html { redirect_to @award_type, notice: 'Award type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @award_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /award_types/1
  # DELETE /award_types/1.json
  def destroy
    @award_type = AwardType.find(params[:id])
    @award_type.destroy

    respond_to do |format|
      format.html { redirect_to award_types_url }
      format.json { head :no_content }
    end
  end
end
