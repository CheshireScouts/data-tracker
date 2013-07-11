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
  
  it 'has an organisation' do
    FactoryGirl.create(:award).should belong_to(:organisation)
  end

  it 'has a year' do
    FactoryGirl.create(:award).should belong_to(:year)
  end

  it 'has an award type' do
    FactoryGirl.create(:award).should belong_to(:award_type)
  end

  it 'has a scout type' do
    FactoryGirl.create(:award).should belong_to(:scout_type)
  end
end