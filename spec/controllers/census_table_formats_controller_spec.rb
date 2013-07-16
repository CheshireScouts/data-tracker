require 'spec_helper'

describe CensusTableFormatsController do

  before(:each) do
    sign_in
  end

  describe "GET index" do
    it "populates an array of census table formats" do
      census_table_format = FactoryGirl.create(:census_table_format)
      get :index
      assigns(:census_table_formats).should eq([census_table_format])
    end
    
    it "renders the index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET show" do
    it "assigns the requested census table format" do
      census_table_format = FactoryGirl.create(:census_table_format)
      get :show, id: census_table_format
      assigns(:census_table_format).should eq(census_table_format)
    end

    it "renders the show view" do
      get :show, id: FactoryGirl.create(:census_table_format)
      response.should render_template :show
    end
  end

  describe "GET new" do 
    it "renders the :new template" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST create" do 
    context "with valid attributes" do 
      it "saves the new census table format in the database" do
        expect {
          post :create, census_table_format: build_attributes(:census_table_format)
        }.to change(CensusFormat, :count).by(1)
      end

      it "redirects to the new census table format" do
        post :create, census_table_format: build_attributes(:census_table_format)
        response.should render_template CensusFormat.last
      end

    end

    context "with invalid attributes" do 
      it "does not save the new census table format in the database" do
        expect{
          post :create, census_table_format: build_attributes(:invalid_census_table_format)
        }.to_not change(CensusFormat, :count)
      end

      it "re-renders the new template" do
        post :create, census_table_format: build_attributes(:invalid_census_table_format)
        response.should render_template :new
      end
    end
  end

  describe "PUT update" do
    before :each do
      @census_table_format = FactoryGirl.create(:census_table_format, column: 25, row: 25)
    end

    context "with valid attributes"  do
      it "locates the requested census table format" do
        put :update, id: @census_table_format, census_table_format: build_attributes(:census_table_format)
        assigns(:census_table_format).should eq(@census_table_format)
      end

      it "changes the census table format's attributes" do
        put :update, id: @census_table_format, census_table_format: build_attributes(:census_table_format, column: 30, row: 30)
        @census_table_format.reload
        @census_table_format.column.should eq(30)
      end

      it "redirects to the updated census table format" do 
        put :update, id: @census_table_format, contact: build_attributes(:census_table_format)
        response.should redirect_to @census_table_format
      end
    end

    context "with invalid attributes" do
      it "locates the requested census table format" do
        put :update, id: @census_table_format, census_table_format: build_attributes(:invalid_census_table_format)
        assigns(:census_table_format).should eq(@census_table_format)
      end

      it "does not change the census table format's attributes" do
        put :update, id: @census_table_format, census_table_format: build_attributes(:census_table_format, census_format: nil)
        @census_table_format.reload
        @census_table_format.census_format.should_not eq(nil)
      end

      it "redirects to the edit method" do
        put :update, id: @census_table_format, census_table_format: build_attributes(:invalid_census_table_format)
        response.should render_template :edit
      end

    end
  end

  describe "DELETE destroy" do
    before :each do
      @census_table_format = FactoryGirl.create(:census_table_format)
    end

    it "deletes the census table format" do
      expect{
        delete :destroy, id: @census_table_format
      }.to change(CensusTableFormat, :count).by(-1)
    end

    it "redirects to the index" do
      delete :destroy, id: @census_table_format
      response.should redirect_to census_table_formats_url
    end
  end

end