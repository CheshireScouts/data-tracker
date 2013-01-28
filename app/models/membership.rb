class Membership < ActiveRecord::Base
  GENDERS = {'M' => 'Male', 'F' => 'Female'}
  MEMBERSHIP_TYPES = {'A' => 'Adult', 'Y' => 'Youth'}
  belongs_to :organisation
  belongs_to :year
  attr_accessible :organisation, :organisation_id, :year, :year_id, :gender, :head_count, :membership_type
end
