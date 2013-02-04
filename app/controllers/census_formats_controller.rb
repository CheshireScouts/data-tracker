class CensusFormatsController < ApplicationController
  # GET /census_formats
  # GET /census_formats.json
  def index
    @census_formats = CensusFormat.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @census_formats }
    end
  end

  # GET /census_formats/1
  # GET /census_formats/1.json
  def show
    @census_format = CensusFormat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @census_format }
    end
  end

  # GET /census_formats/new
  # GET /census_formats/new.json
  def new
    @census_format = CensusFormat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @census_format }
    end
  end

  # GET /census_formats/1/edit
  def edit
    @census_format = CensusFormat.find(params[:id])
  end

  # POST /census_formats
  # POST /census_formats.json
  def create
    @census_format = CensusFormat.new(params[:census_format])

    respond_to do |format|
      if @census_format.save
        format.html { redirect_to @census_format, notice: 'Census format was successfully created.' }
        format.json { render json: @census_format, status: :created, location: @census_format }
      else
        format.html { render action: "new" }
        format.json { render json: @census_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /census_formats/1
  # PUT /census_formats/1.json
  def update
    @census_format = CensusFormat.find(params[:id])

    respond_to do |format|
      if @census_format.update_attributes(params[:census_format])
        format.html { redirect_to @census_format, notice: 'Census format was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @census_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /census_formats/1
  # DELETE /census_formats/1.json
  def destroy
    @census_format = CensusFormat.find(params[:id])
    @census_format.destroy

    respond_to do |format|
      format.html { redirect_to census_formats_url }
      format.json { head :no_content }
    end
  end
end
