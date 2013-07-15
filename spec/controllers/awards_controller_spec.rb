require 'spec_helper'

describe AwardsController do

  before(:each) do
    sign_in
  end

  describe "GET index" do
    it "populates an array of award" do
      award = FactoryGirl.create(:award)
      get :index
      assigns(:awards).should eq([award])
    end
    
    it "renders the index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET show" do
    it "assigns the requested award" do
      award = FactoryGirl.create(:award)
      get :show, id: award
      assigns(:award).should eq(award)
    end

    it "renders the show view" do
      get :show, id: FactoryGirl.create(:award)
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
      it "saves the new award in the database" do
        expect {
          post :create, award: build_attributes(:award)
        }.to change(Award, :count).by(1)
      end

      it "redirects to the new award" do
        post :create, award: build_attributes(:award)
        response.should render_template Award.last
      end

    end

    context "with invalid attributes" do 
      it "does not save the new award in the database" do
        expect{
          post :create, award: build_attributes(:invalid_award)
        }.to_not change(Award, :count)
      end

      it "re-renders the new template" do
        post :create, award: build_attributes(:invalid_award)
        response.should render_template :new
      end
    end
  end

  describe "PUT update" do
    before :each do
      @award = FactoryGirl.create(:award, award_count: 5)
    end

    context "with valid attributes"  do
      it "locates the requested award" do
        put :update, id: @award, award: FactoryGirl.attributes_for(:award, award_count: 5)
        assigns(:award).should eq(@award)
      end

      it "changes the award's attributes" do
        put :update, id: @award, award: FactoryGirl.attributes_for(:award, award_count: 10)
        @award.reload
        @award.award_count.should eq(10)
      end

      it "redirects to the updated award" do 
        put :update, id: @award, award: FactoryGirl.attributes_for(:award, award_count: 10)
        response.should redirect_to @award
      end
    end

    context "with invalid attributes" do
      it "locates the requested award" do
        put :update, id: @award, award: build_attributes(:invalid_award)
        assigns(:award).should eq(@award)
      end

      it "does not change the award's attributes" do
        put :update, id: @award, award: build_attributes(:invalid_award)
        @award.reload
        @award.organisation.should_not eq(nil)
      end

      it "redirects to the edit method" do
        put :update, id: @award, award: build_attributes(:invalid_award)
        response.should render_template :edit
      end

    end
  end

  describe "DELETE destroy" do
    before :each do
      @award = FactoryGirl.create(:award)
    end

    it "deletes the award" do
      expect{
        delete :destroy, id: @award
      }.to change(Award, :count).by(-1)
    end

    it "redirects to the index" do
      delete :destroy, id: @award
      response.should redirect_to awards_url
    end
  end

end