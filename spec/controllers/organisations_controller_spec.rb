require 'spec_helper'

describe OrganisationsController do

  before(:each) do
    sign_in
  end

  describe "GET index" do
    it "populates an array of organisations" do
      organisation = FactoryGirl.create(:organisation)
      get :index
      assigns(:organisations).should eq([organisation])
    end
    
    it "renders the index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET show" do
    it "assigns the requested organisation" do
      organisation = FactoryGirl.create(:organisation)
      get :show, id: organisation
      assigns(:organisation).should eq(organisation)
    end

    it "renders the show view" do
      get :show, id: FactoryGirl.create(:organisation)
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
      it "saves the new organisation in the database" do
        expect {
          post :create, organisation: build_attributes(:organisation)
        }.to change(Organisation, :count).by(1)
      end

      it "redirects to the new organisation" do
        post :create, organisation: build_attributes(:organisation)
        response.should render_template Organisation.last
      end

    end

    context "with invalid attributes" do 
      it "does not save the new organisation in the database" do
        expect{
          post :create, organisation: build_attributes(:invalid_organisation)
        }.to_not change(Organisation, :count)
      end

      it "re-renders the new template" do
        post :create, organisation: build_attributes(:invalid_organisation)
        response.should render_template :new
      end
    end
  end

  describe "PUT update" do
    before :each do
      @organisation = FactoryGirl.create(:organisation, name: "Test Organisation")
    end

    context "with valid attributes"  do
      it "locates the requested organisation" do
        put :update, id: @organisation, organisation: FactoryGirl.attributes_for(:organisation, name: "Updated Test Organisation")
        assigns(:organisation).should eq(@organisation)
      end

      it "changes the organisation's attributes" do
        put :update, id: @organisation, organisation: FactoryGirl.attributes_for(:organisation, name: "Updated Test Organisation")
        @organisation.reload
        @organisation.name.should eq("Updated Test Organisation")
      end

      it "redirects to the updated organisation" do 
        put :update, id: @organisation, organisation: FactoryGirl.attributes_for(:organisation, name: "Updated Test Organisation")
        response.should redirect_to @organisation
      end
    end

    context "with invalid attributes" do
      it "locates the requested organisation" do
        put :update, id: @organisation, organisation: build_attributes(:invalid_organisation)
        assigns(:organisation).should eq(@organisation)
      end

      it "does not change the organisation's attributes" do
        put :update, id: @organisation, organisation: build_attributes(:invalid_organisation)
        @organisation.reload
        @organisation.name.should_not eq(nil)
      end

      it "redirects to the edit method" do
        put :update, id: @organisation, organisation: build_attributes(:invalid_organisation)
        response.should render_template :edit
      end

    end
  end

  describe "DELETE destroy" do
    before :each do
      @organisation = FactoryGirl.create(:organisation)
    end

    it "deletes the organisation" do
      expect{
        delete :destroy, id: @organisation
      }.to change(Organisation, :count).by(-1)
    end

    it "redirects to the index" do
      delete :destroy, id: @organisation
      response.should redirect_to organisations_url
    end
  end

end