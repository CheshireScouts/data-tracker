require 'spec_helper'

describe MembershipType do

  it 'has a valid factory' do
    FactoryGirl.create(:membership_type).should be_valid
  end

  it 'is invalid without a name' do
    FactoryGirl.build(:membership_type, name: nil).should_not be_valid
  end

  it 'has many memberships' do
    FactoryGirl.create(:membership_type).should have_many(:memberships)
  end
  
end