require 'spec_helper'

describe CensusTableFormat do

  it 'has a valid factory' do
    FactoryGirl.create(:census_table_format).should be_valid
  end

  it 'is invalid without a census format' do
    FactoryGirl.build(:census_table_format, census_format: nil).should_not be_valid
  end
  
  it 'is invalid without a scout type' do
    FactoryGirl.build(:census_table_format, scout_type: nil).should_not be_valid
  end

  it 'is invalid without a membership type' do
    FactoryGirl.build(:census_table_format, membership_type: nil).should_not be_valid
  end

  it 'has a census_format' do
    FactoryGirl.create(:census_table_format).should belong_to(:census_format)
  end

  it 'has a scout_type' do
    FactoryGirl.create(:census_table_format).should belong_to(:scout_type)
  end

  it 'has a membership_type' do
    FactoryGirl.create(:census_table_format).should belong_to(:membership_type)
  end

end