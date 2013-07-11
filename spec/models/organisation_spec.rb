require 'spec_helper'

describe Organisation do

  it 'has a valid factory' do
    FactoryGirl.create(:organisation).should be_valid
  end

  it 'is invalid without a name' do
    FactoryGirl.build(:organisation, name: nil).should_not be_valid
  end
  
  it 'is invalid without a registration number' do
    FactoryGirl.build(:organisation, registration_no: nil).should_not be_valid
  end

  it 'is invalid without a registration number for the census' do
    FactoryGirl.build(:organisation, census_url_no: nil).should_not be_valid
  end

  it 'is invalid without a status' do
    FactoryGirl.build(:organisation, status: nil).should_not be_valid
  end

  it 'has many memberships' do
    FactoryGirl.create(:organisation).should have_many(:memberships)
  end

  it 'has many awards' do
    FactoryGirl.create(:organisation).should have_many(:awards)
  end

  it 'has many composites' do
    FactoryGirl.create(:organisation).should have_many(:composites)
  end

end