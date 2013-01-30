class MembershipTypesController < ApplicationController
  load_and_authorize_resource
  # GET /membership_types
  # GET /membership_types.json
  def index
    @membership_types = MembershipType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @membership_types }
    end
  end

  # GET /membership_types/1
  # GET /membership_types/1.json
  def show
    @membership_type = MembershipType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @membership_type }
    end
  end

  # GET /membership_types/new
  # GET /membership_types/new.json
  def new
    @membership_type = MembershipType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @membership_type }
    end
  end

  # GET /membership_types/1/edit
  def edit
    @membership_type = MembershipType.find(params[:id])
  end

  # POST /membership_types
  # POST /membership_types.json
  def create
    @membership_type = MembershipType.new(params[:membership_type])

    respond_to do |format|
      if @membership_type.save
        format.html { redirect_to @membership_type, notice: 'Membership type was successfully created.' }
        format.json { render json: @membership_type, status: :created, location: @membership_type }
      else
        format.html { render action: "new" }
        format.json { render json: @membership_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /membership_types/1
  # PUT /membership_types/1.json
  def update
    @membership_type = MembershipType.find(params[:id])

    respond_to do |format|
      if @membership_type.update_attributes(params[:membership_type])
        format.html { redirect_to @membership_type, notice: 'Membership type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @membership_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /membership_types/1
  # DELETE /membership_types/1.json
  def destroy
    @membership_type = MembershipType.find(params[:id])
    @membership_type.destroy

    respond_to do |format|
      format.html { redirect_to membership_types_url }
      format.json { head :no_content }
    end
  end
end
