class Membership < ActiveRecord::Base
  GENDERS = {'M' => 'Male', 'F' => 'Female'}
  belongs_to :organisation
  belongs_to :year
  belongs_to :membership_type
  attr_accessible :organisation, :organisation_id, :year, :year_id, :gender, :head_count, :membership_type, :membership_type_id

  def gender_text
  	GENDERS[gender]
  end
end
