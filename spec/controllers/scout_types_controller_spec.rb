require 'spec_helper'

describe ScoutTypesController do

  before(:each) do
    sign_in
  end

  describe "GET index" do
    it "populates an array of scout types" do
      scout_type = FactoryGirl.create(:scout_type)
      get :index
      assigns(:scout_types).should eq([scout_type])
    end
    
    it "renders the index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET show" do
    it "assigns the requested scout type" do
      scout_type = FactoryGirl.create(:scout_type)
      get :show, id: scout_type
      assigns(:scout_type).should eq(scout_type)
    end

    it "renders the show view" do
      get :show, id: FactoryGirl.create(:scout_type)
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
      it "saves the new scout type in the database" do
        expect {
          post :create, scout_type: FactoryGirl.attributes_for(:scout_type)
        }.to change(ScoutType, :count).by(1)
      end

      it "redirects to the new scout type" do
        post :create, scout_type: FactoryGirl.attributes_for(:scout_type)
        response.should render_template ScoutType.last
      end

    end

    context "with invalid attributes" do 
      it "does not save the new scout type in the database" do
        expect{
          post :create, scout_type: FactoryGirl.attributes_for(:invalid_scout_type)
        }.to_not change(ScoutType, :count)
      end

      it "re-renders the new template" do
        post :create, scout_type: FactoryGirl.attributes_for(:invalid_scout_type)
        response.should render_template :new
      end
    end
  end

  describe "PUT update" do
    before :each do
      @scout_type = FactoryGirl.create(:scout_type, name: "Test Scout Type")
    end

    context "with valid attributes"  do
      it "locates the requested scout type" do
        put :update, id: @scout_type, scout_type: FactoryGirl.attributes_for(:scout_type)
        assigns(:scout_type).should eq(@scout_type)
      end

      it "changes the scout type's attributes" do
        put :update, id: @scout_type, scout_type: FactoryGirl.attributes_for(:scout_type, name: "Updated Test Scout Type")
        @scout_type.reload
        @scout_type.name.should eq("Updated Test Scout Type")
      end

      it "redirects to the updated scout type" do 
        put :update, id: @scout_type, contact: FactoryGirl.attributes_for(:scout_type)
        response.should redirect_to @scout_type
      end
    end

    context "with invalid attributes" do
      it "locates the requested scout type" do
        put :update, id: @scout_type, scout_type: FactoryGirl.attributes_for(:invalid_scout_type)
        assigns(:scout_type).should eq(@scout_type)
      end

      it "does not change the scout type's attributes" do
        put :update, id: @scout_type, scout_type: FactoryGirl.attributes_for(:scout_type, name: nil)
        @scout_type.reload
        @scout_type.name.should_not eq(nil)
      end

      it "redirects to the edit method" do
        put :update, id: @scout_type, scout_type: FactoryGirl.attributes_for(:invalid_scout_type)
        response.should render_template :edit
      end

    end
  end

  describe "DELETE destroy" do
    before :each do
      @scout_type = FactoryGirl.create(:scout_type)
    end

    it "deletes the scout type" do
      expect{
        delete :destroy, id: @scout_type
      }.to change(ScoutType, :count).by(-1)
    end

    it "redirects to the index" do
      delete :destroy, id: @scout_type
      response.should redirect_to scout_types_url
    end
  end

end