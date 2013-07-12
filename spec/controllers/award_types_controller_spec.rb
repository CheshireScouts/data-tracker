require 'spec_helper'


describe AwardTypesController do

  before(:each) do
    sign_in
  end

  describe "Get index" do
    
    it "renders the :index view" do
      get :index, :format => "html"
      response.should render_template(:index)
    end

  end

end