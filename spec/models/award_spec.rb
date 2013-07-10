require 'spec_helper'

describe Award do

  it 'has a valid factory' do
    FactoryGirl.create(:award).should be_valid
  end

  it 'is invalid without an organisation' do
    FactoryGirl.build(:award, organisation: nil).should_not be_valid
  end

  it 'is invalid without a year' do
    FactoryGirl.build(:award, year: nil).should_not be_valid
  end

  it 'is invalid without an award type' do
    FactoryGirl.build(:award, award_type: nil).should_not be_valid
  end

  it 'is invalid without a scout type' do
    FactoryGirl.build(:award, scout_type: nil).should_not be_valid
  end
  
end