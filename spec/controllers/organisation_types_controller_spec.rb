require 'spec_helper'

describe OrganisationTypesController do

  before(:each) do
    sign_in
  end

  describe "GET index" do
    it "populates an array of organisations types" do
      organisation_type = FactoryGirl.create(:organisation_type)
      get :index
      assigns(:organisation_types).should eq([organisation_type])
    end
    
    it "renders the index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET show" do
    it "assigns the requested organisation type" do
      organisation_type = FactoryGirl.create(:organisation_type)
      get :show, id: organisation_type
      assigns(:organisation_type).should eq(organisation_type)
    end

    it "renders the show view" do
      get :show, id: FactoryGirl.create(:organisation_type)
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
      it "saves the new organisation type in the database" do
        expect {
          post :create, organisation_type: FactoryGirl.attributes_for(:organisation_type)
        }.to change(OrganisationType, :count).by(1)
      end

      it "redirects to the new organisation type" do
        post :create, organisation_type: FactoryGirl.attributes_for(:organisation_type)
        response.should render_template OrganisationType.last
      end

    end

    context "with invalid attributes" do 
      it "does not save the new organisation type in the database" do
        expect{
          post :create, organisation_type: FactoryGirl.attributes_for(:invalid_organisation_type)
        }.to_not change(OrganisationType, :count)
      end

      it "re-renders the new template" do
        post :create, organisation_type: FactoryGirl.attributes_for(:invalid_organisation_type)
        response.should render_template :new
      end
    end
  end

  describe "PUT update" do
    before :each do
      @organisation_type = FactoryGirl.create(:organisation_type, name: "Test Organisation type")
    end

    context "with valid attributes"  do
      it "locates the requested organisation type" do
        put :update, id: @organisation_type, organisation_type: FactoryGirl.attributes_for(:organisation_type)
        assigns(:organisation_type).should eq(@organisation_type)
      end

      it "changes the organisation type's attributes" do
        put :update, id: @organisation_type, organisation_type: FactoryGirl.attributes_for(:organisation_type, name: "Updated Test Organisation type")
        @organisation_type.reload
        @organisation_type.name.should eq("Updated Test Organisation type")
      end

      it "redirects to the updated organisation type" do 
        put :update, id: @organisation_type, contact: FactoryGirl.attributes_for(:organisation_type)
        response.should redirect_to @organisation_type
      end
    end

    context "with invalid attributes" do
      it "locates the requested organisation type" do
        put :update, id: @organisation_type, organisation_type: FactoryGirl.attributes_for(:invalid_organisation_type)
        assigns(:organisation_type).should eq(@organisation_type)
      end

      it "does not change the organisation type's attributes" do
        put :update, id: @organisation_type, organisation_type: FactoryGirl.attributes_for(:organisation_type, name: nil)
        @organisation_type.reload
        @organisation_type.name.should_not eq(nil)
      end

      it "redirects to the edit method" do
        put :update, id: @organisation_type, organisation_type: FactoryGirl.attributes_for(:invalid_organisation_type)
        response.should render_template :edit
      end

    end
  end

  describe "DELETE destroy" do
    before :each do
      @organisation_type = FactoryGirl.create(:organisation_type)
    end

    it "deletes the organisation type" do
      expect{
        delete :destroy, id: @organisation_type
      }.to change(OrganisationType, :count).by(-1)
    end

    it "redirects to the index" do
      delete :destroy, id: @organisation_type
      response.should redirect_to organisation_types_url
    end
  end

end