require 'spec_helper'

describe AwardType do

  it 'has a valid factory' do
    FactoryGirl.create(:award_type).should be_valid
  end

  it 'is invalid without a name' do
    FactoryGirl.build(:award_type, name: nil).should_not be_valid
  end
  
end