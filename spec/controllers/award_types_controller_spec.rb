require 'spec_helper'

describe AwardTypesController do

  before(:each) do
    sign_in
  end

  describe "GET index" do
    it "populates an array of awards types" do
      award_type = FactoryGirl.create(:award_type)
      get :index
      assigns(:award_types).should eq([award_type])
    end
    
    it "renders the index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET show" do
    it "assigns the requested award type" do
      award_type = FactoryGirl.create(:award_type)
      get :show, id: award_type
      assigns(:award_type).should eq(award_type)
    end

    it "renders the show view" do
      get :show, id: FactoryGirl.create(:award_type)
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
      it "saves the new award type in the database" do
        expect {
          post :create, award_type: FactoryGirl.attributes_for(:award_type)
        }.to change(AwardType, :count).by(1)
      end

      it "redirects to the new award type" do
        post :create, award_type: FactoryGirl.attributes_for(:award_type)
        response.should render_template AwardType.last
      end

    end

    context "with invalid attributes" do 
      it "does not save the new award type in the database" do
        expect{
          post :create, award_type: FactoryGirl.attributes_for(:invalid_award_type)
        }.to_not change(AwardType, :count)
      end

      it "re-renders the new template" do
        post :create, award_type: FactoryGirl.attributes_for(:invalid_award_type)
        response.should render_template :new
      end
    end
  end

  describe "PUT update" do
    before :each do
      @award_type = FactoryGirl.create(:award_type, name: "Test Award")
    end

    context "with valid attributes"  do
      it "locates the requested award type" do
        put :update, id: @award_type, award_type: FactoryGirl.attributes_for(:award_type)
        assigns(:award_type).should eq(@award_type)
      end

      it "changes the award type's attributes" do
        put :update, id: @award_type, award_type: FactoryGirl.attributes_for(:award_type, name: "Updated Test Award")
        @award_type.reload
        @award_type.name.should eq("Updated Test Award")
      end

      it "redirects to the updated award type" do 
        put :update, id: @award_type, contact: FactoryGirl.attributes_for(:award_type)
        response.should redirect_to @award_type
      end
    end

    context "with invalid attributes" do
      it "locates the requested award type" do
        put :update, id: @award_type, award_type: FactoryGirl.attributes_for(:invalid_award_type)
        assigns(:award_type).should eq(@award_type)
      end

      it "does not change the award type's attributes" do
        put :update, id: @award_type, award_type: FactoryGirl.attributes_for(:award_type, name: nil)
        @award_type.reload
        @award_type.name.should_not eq(nil)
      end

      it "redirects to the edit method" do
        put :update, id: @award_type, award_type: FactoryGirl.attributes_for(:invalid_award_type)
        response.should render_template :edit
      end

    end
  end

  describe "DELETE destroy" do
    before :each do
      @award_type = FactoryGirl.create(:award_type)
    end

    it "deletes the award type" do
      expect{
        delete :destroy, id: @award_type
      }.to change(AwardType, :count).by(-1)
    end

    it "redirects to the index" do
      delete :destroy, id: @award_type
      response.should redirect_to award_types_url
    end
  end

end