require 'spec_helper'

describe MembershipTypesController do

  before(:each) do
    sign_in
  end

  describe "GET index" do
    it "populates an array of memberships types" do
      membership_type = FactoryGirl.create(:membership_type)
      get :index
      assigns(:membership_types).should eq([membership_type])
    end
    
    it "renders the index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET show" do
    it "assigns the requested membership type" do
      membership_type = FactoryGirl.create(:membership_type)
      get :show, id: membership_type
      assigns(:membership_type).should eq(membership_type)
    end

    it "renders the show view" do
      get :show, id: FactoryGirl.create(:membership_type)
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
      it "saves the new membership type in the database" do
        expect {
          post :create, membership_type: FactoryGirl.attributes_for(:membership_type)
        }.to change(MembershipType, :count).by(1)
      end

      it "redirects to the new membership type" do
        post :create, membership_type: FactoryGirl.attributes_for(:membership_type)
        response.should render_template MembershipType.last
      end

    end

    context "with invalid attributes" do 
      it "does not save the new membership type in the database" do
        expect{
          post :create, membership_type: FactoryGirl.attributes_for(:invalid_membership_type)
        }.to_not change(MembershipType, :count)
      end

      it "re-renders the new template" do
        post :create, membership_type: FactoryGirl.attributes_for(:invalid_membership_type)
        response.should render_template :new
      end
    end
  end

  describe "PUT update" do
    before :each do
      @membership_type = FactoryGirl.create(:membership_type, name: "Test Membership type")
    end

    context "with valid attributes"  do
      it "locates the requested membership type" do
        put :update, id: @membership_type, membership_type: FactoryGirl.attributes_for(:membership_type)
        assigns(:membership_type).should eq(@membership_type)
      end

      it "changes the membership type's attributes" do
        put :update, id: @membership_type, membership_type: FactoryGirl.attributes_for(:membership_type, name: "Updated Test Membership type")
        @membership_type.reload
        @membership_type.name.should eq("Updated Test Membership type")
      end

      it "redirects to the updated membership type" do 
        put :update, id: @membership_type, contact: FactoryGirl.attributes_for(:membership_type)
        response.should redirect_to @membership_type
      end
    end

    context "with invalid attributes" do
      it "locates the requested membership type" do
        put :update, id: @membership_type, membership_type: FactoryGirl.attributes_for(:invalid_membership_type)
        assigns(:membership_type).should eq(@membership_type)
      end

      it "does not change the membership type's attributes" do
        put :update, id: @membership_type, membership_type: FactoryGirl.attributes_for(:membership_type, name: nil)
        @membership_type.reload
        @membership_type.name.should_not eq(nil)
      end

      it "redirects to the edit method" do
        put :update, id: @membership_type, membership_type: FactoryGirl.attributes_for(:invalid_membership_type)
        response.should render_template :edit
      end

    end
  end

  describe "DELETE destroy" do
    before :each do
      @membership_type = FactoryGirl.create(:membership_type)
    end

    it "deletes the membership type" do
      expect{
        delete :destroy, id: @membership_type
      }.to change(MembershipType, :count).by(-1)
    end

    it "redirects to the index" do
      delete :destroy, id: @membership_type
      response.should redirect_to membership_types_url
    end
  end

end