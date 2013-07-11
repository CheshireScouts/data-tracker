require 'spec_helper'

describe Year do

  it 'has a valid factory' do
    FactoryGirl.create(:year).should be_valid
  end

  it 'is invalid without a name' do
    FactoryGirl.build(:year, name: nil).should_not be_valid
  end

  it 'is invalid without a group census format' do
    FactoryGirl.build(:year, group_census_format: nil).should_not be_valid
  end

  it 'is invalid without a district census format' do
    FactoryGirl.build(:year, district_census_format: nil).should_not be_valid
  end

  it 'is invalid without a county census format' do
    FactoryGirl.build(:year, county_census_format: nil).should_not be_valid
  end

  it 'has many memberships' do
    FactoryGirl.create(:year).should have_many(:memberships)
  end

  it 'belongs to a group_census_format' do
    FactoryGirl.create(:year).should belong_to(:group_census_format)
  end

  it 'belongs to a district_census_format' do
    FactoryGirl.create(:year).should belong_to(:district_census_format)
  end

  it 'belongs to a county_census_format' do
    FactoryGirl.create(:year).should belong_to(:county_census_format)
  end
  
end