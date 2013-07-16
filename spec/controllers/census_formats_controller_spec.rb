require 'spec_helper'

describe CensusFormatsController do

  before(:each) do
    sign_in
  end

  describe "GET index" do
    it "populates an array of census formats" do
      census_format = FactoryGirl.create(:census_format)
      get :index
      assigns(:census_formats).should eq([census_format])
    end
    
    it "renders the index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET show" do
    it "assigns the requested census format" do
      census_format = FactoryGirl.create(:census_format)
      get :show, id: census_format
      assigns(:census_format).should eq(census_format)
    end

    it "renders the show view" do
      get :show, id: FactoryGirl.create(:census_format)
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
      it "saves the new census format in the database" do
        expect {
          post :create, census_format: FactoryGirl.attributes_for(:census_format)
        }.to change(CensusFormat, :count).by(1)
      end

      it "redirects to the new census format" do
        post :create, census_format: FactoryGirl.attributes_for(:census_format)
        response.should render_template CensusFormat.last
      end

    end

    context "with invalid attributes" do 
      it "does not save the new census format in the database" do
        expect{
          post :create, census_format: FactoryGirl.attributes_for(:invalid_census_format)
        }.to_not change(CensusFormat, :count)
      end

      it "re-renders the new template" do
        post :create, census_format: FactoryGirl.attributes_for(:invalid_census_format)
        response.should render_template :new
      end
    end
  end

  describe "PUT update" do
    before :each do
      @census_format = FactoryGirl.create(:census_format, name: "Test Award")
    end

    context "with valid attributes"  do
      it "locates the requested census format" do
        put :update, id: @census_format, census_format: FactoryGirl.attributes_for(:census_format)
        assigns(:census_format).should eq(@census_format)
      end

      it "changes the census format's attributes" do
        put :update, id: @census_format, census_format: FactoryGirl.attributes_for(:census_format, name: "Updated Test Award")
        @census_format.reload
        @census_format.name.should eq("Updated Test Award")
      end

      it "redirects to the updated census format" do 
        put :update, id: @census_format, contact: FactoryGirl.attributes_for(:census_format)
        response.should redirect_to @census_format
      end
    end

    context "with invalid attributes" do
      it "locates the requested census format" do
        put :update, id: @census_format, census_format: FactoryGirl.attributes_for(:invalid_census_format)
        assigns(:census_format).should eq(@census_format)
      end

      it "does not change the census format's attributes" do
        put :update, id: @census_format, census_format: FactoryGirl.attributes_for(:census_format, name: nil)
        @census_format.reload
        @census_format.name.should_not eq(nil)
      end

      it "redirects to the edit method" do
        put :update, id: @census_format, census_format: FactoryGirl.attributes_for(:invalid_census_format)
        response.should render_template :edit
      end

    end
  end

  describe "DELETE destroy" do
    before :each do
      @census_format = FactoryGirl.create(:census_format)
    end

    it "deletes the census format" do
      expect{
        delete :destroy, id: @census_format
      }.to change(CensusFormat, :count).by(-1)
    end

    it "redirects to the index" do
      delete :destroy, id: @census_format
      response.should redirect_to census_formats_url
    end
  end

end