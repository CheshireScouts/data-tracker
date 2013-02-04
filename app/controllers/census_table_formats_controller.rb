class CensusTableFormatsController < ApplicationController
  # GET /census_table_formats
  # GET /census_table_formats.json
  def index
    @census_table_formats = CensusTableFormat.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @census_table_formats }
    end
  end

  # GET /census_table_formats/1
  # GET /census_table_formats/1.json
  def show
    @census_table_format = CensusTableFormat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @census_table_format }
    end
  end

  # GET /census_table_formats/new
  # GET /census_table_formats/new.json
  def new
    @census_table_format = CensusTableFormat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @census_table_format }
    end
  end

  # GET /census_table_formats/1/edit
  def edit
    @census_table_format = CensusTableFormat.find(params[:id])
  end

  # POST /census_table_formats
  # POST /census_table_formats.json
  def create
    @census_table_format = CensusTableFormat.new(params[:census_table_format])

    respond_to do |format|
      if @census_table_format.save
        format.html { redirect_to @census_table_format, notice: 'Census table format was successfully created.' }
        format.json { render json: @census_table_format, status: :created, location: @census_table_format }
      else
        format.html { render action: "new" }
        format.json { render json: @census_table_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /census_table_formats/1
  # PUT /census_table_formats/1.json
  def update
    @census_table_format = CensusTableFormat.find(params[:id])

    respond_to do |format|
      if @census_table_format.update_attributes(params[:census_table_format])
        format.html { redirect_to @census_table_format, notice: 'Census table format was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @census_table_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /census_table_formats/1
  # DELETE /census_table_formats/1.json
  def destroy
    @census_table_format = CensusTableFormat.find(params[:id])
    @census_table_format.destroy

    respond_to do |format|
      format.html { redirect_to census_table_formats_url }
      format.json { head :no_content }
    end
  end
end
