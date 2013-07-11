require 'spec_helper'

describe ScoutType do

  it 'has a valid factory' do
    FactoryGirl.create(:scout_type).should be_valid
  end

  it 'is invalid without a name' do
    FactoryGirl.build(:scout_type, name: nil).should_not be_valid
  end

  it 'has many memberships' do
    FactoryGirl.create(:scout_type).should have_many(:memberships)
  end
  
end