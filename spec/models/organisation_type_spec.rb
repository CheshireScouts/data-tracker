require 'spec_helper'

describe OrganisationType do

  it 'has a valid factory' do
    FactoryGirl.create(:organisation_type).should be_valid
  end

  it 'is invalid without a name' do
    FactoryGirl.build(:organisation_type, name: nil).should_not be_valid
  end
  
end