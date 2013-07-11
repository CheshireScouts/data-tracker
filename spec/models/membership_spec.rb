require 'spec_helper'

describe Membership do

  it 'has a valid factory' do
    FactoryGirl.create(:membership).should be_valid
  end

  it 'is invalid without an organisation' do
    FactoryGirl.build(:membership, organisation: nil).should_not be_valid
  end

  it 'is invalid without a year' do
    FactoryGirl.build(:membership, year: nil).should_not be_valid
  end

  it 'is invalid without a membership type' do
    FactoryGirl.build(:membership, membership_type: nil).should_not be_valid
  end

  it 'is invalid without a scout type' do
    FactoryGirl.build(:membership, scout_type: nil).should_not be_valid
  end

  it 'has an organisation' do
    FactoryGirl.create(:membership).should belong_to(:organisation)
  end

  it 'has a year' do
    FactoryGirl.create(:membership).should belong_to(:year)
  end

  it 'has a membership type' do
    FactoryGirl.create(:membership).should belong_to(:membership_type)
  end

  it 'has a scout type' do
    FactoryGirl.create(:membership).should belong_to(:scout_type)
  end
  
end