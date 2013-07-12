require 'spec_helper'


describe AwardTypesController do

  before(:each) do
    sign_in
  end

  describe "Get index" do
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

  describe "Get show" do
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

end