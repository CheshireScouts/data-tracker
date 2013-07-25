require 'spec_helper'

describe MembershipsController do

  before(:each) do
    sign_in
  end

  describe "GET index" do
    it "populates an array of memberships" do
      membership = FactoryGirl.create(:membership)
      get :index
      assigns(:memberships).should eq([membership])
    end
    
    it "renders the index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET show" do
    it "assigns the requested membership" do
      membership = FactoryGirl.create(:membership)
      get :show, id: membership
      assigns(:membership).should eq(membership)
    end

    it "renders the show view" do
      get :show, id: FactoryGirl.create(:membership)
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
      it "saves the new membership in the database" do
        expect {
          post :create, membership: build_attributes(:membership)
        }.to change(Membership, :count).by(1)
      end

      it "redirects to the new membership" do
        post :create, membership: build_attributes(:membership)
        response.should render_template Membership.last
      end

    end

    context "with invalid attributes" do 
      it "does not save the new membership in the database" do
        expect{
          post :create, membership: build_attributes(:invalid_membership)
        }.to_not change(Membership, :count)
      end

      it "re-renders the new template" do
        post :create, membership: build_attributes(:invalid_membership)
        response.should render_template :new
      end
    end
  end

  describe "PUT update" do
    before :each do
      @membership = FactoryGirl.create(:membership, head_count: 5)
    end

    context "with valid attributes"  do
      it "locates the requested membership" do
        put :update, id: @membership, membership: FactoryGirl.attributes_for(:membership, head_count: 5)
        assigns(:membership).should eq(@membership)
      end

      it "changes the membership's attributes" do
        put :update, id: @membership, membership: FactoryGirl.attributes_for(:membership, head_count: 10)
        @membership.reload
        @membership.head_count.should eq(10)
      end

      it "redirects to the updated membership" do 
        put :update, id: @membership, membership: FactoryGirl.attributes_for(:membership, head_count: 10)
        response.should redirect_to @membership
      end
    end

    context "with invalid attributes" do
      it "locates the requested membership" do
        put :update, id: @membership, membership: build_attributes(:invalid_membership)
        assigns(:membership).should eq(@membership)
      end

      it "does not change the membership's attributes" do
        put :update, id: @membership, membership: build_attributes(:invalid_membership)
        @membership.reload
        @membership.organisation.should_not eq(nil)
      end

      it "redirects to the edit method" do
        put :update, id: @membership, membership: build_attributes(:invalid_membership)
        response.should render_template :edit
      end

    end
  end

  describe "DELETE destroy" do
    before :each do
      @membership = FactoryGirl.create(:membership)
    end

    it "deletes the membership" do
      expect{
        delete :destroy, id: @membership
      }.to change(Membership, :count).by(-1)
    end

    it "redirects to the index" do
      delete :destroy, id: @membership
      response.should redirect_to memberships_url
    end
  end

end