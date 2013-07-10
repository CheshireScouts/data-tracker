require 'spec_helper'

describe CensusFormat do

  it 'has a valid factory' do
    FactoryGirl.create(:census_format).should be_valid
  end

  it 'is invalid without a name' do
    FactoryGirl.build(:census_format, name: nil).should_not be_valid
  end
  
  it 'is invalid without an Xpath definition' do
    FactoryGirl.build(:census_format, table_xpath: nil).should_not be_valid
  end
end