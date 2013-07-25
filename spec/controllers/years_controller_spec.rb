require 'spec_helper'

describe YearsController do

  before(:each) do
    sign_in
  end

  describe "GET index" do
    it "populates an array of years" do
      year = FactoryGirl.create(:year)
      get :index
      assigns(:years).should eq([year])
    end
    
    it "renders the index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET show" do
    it "assigns the requested year" do
      year = FactoryGirl.create(:year)
      get :show, id: year
      assigns(:year).should eq(year)
    end

    it "renders the show view" do
      get :show, id: FactoryGirl.create(:year)
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
      it "saves the new year in the database" do
        expect {
          post :create, year: build_attributes(:year)
        }.to change(Year, :count).by(1)
      end

      it "redirects to the new year" do
        post :create, year: build_attributes(:year)
        response.should render_template Year.last
      end

    end

    context "with invalid attributes" do 
      it "does not save the new year in the database" do
        expect{
          post :create, year: build_attributes(:invalid_year)
        }.to_not change(Year, :count)
      end

      it "re-renders the new template" do
        post :create, year: build_attributes(:invalid_year)
        response.should render_template :new
      end
    end
  end

  describe "PUT update" do
    before :each do
      @year = FactoryGirl.create(:year, name: 2010)
    end

    context "with valid attributes"  do
      it "locates the requested year" do
        put :update, id: @year, year: FactoryGirl.attributes_for(:year, name: 2011)
        assigns(:year).should eq(@year)
      end

      it "changes the year's attributes" do
        put :update, id: @year, year: FactoryGirl.attributes_for(:year, name: 2011)
        @year.reload
        @year.name.should eq(2011)
      end

      it "redirects to the updated year" do 
        put :update, id: @year, year: FactoryGirl.attributes_for(:year, name: 2011)
        response.should redirect_to @year
      end
    end

    context "with invalid attributes" do
      it "locates the requested year" do
        put :update, id: @year, year: build_attributes(:invalid_year)
        assigns(:year).should eq(@year)
      end

      it "does not change the year's attributes" do
        put :update, id: @year, year: build_attributes(:invalid_year)
        @year.reload
        @year.name.should_not eq(nil)
      end

      it "redirects to the edit method" do
        put :update, id: @year, year: build_attributes(:invalid_year)
        response.should render_template :edit
      end

    end
  end

  describe "DELETE destroy" do
    before :each do
      @year = FactoryGirl.create(:year)
    end

    it "deletes the year" do
      expect{
        delete :destroy, id: @year
      }.to change(Year, :count).by(-1)
    end

    it "redirects to the index" do
      delete :destroy, id: @year
      response.should redirect_to years_url
    end
  end

end