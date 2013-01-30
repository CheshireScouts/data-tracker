class Membership < ActiveRecord::Base
  GENDERS = {'M' => 'Male', 'F' => 'Female'}
  MEMBERSHIP_TYPES = {
    'AL' => 'Leader', 
    'EX' => 'Executive Committee Member',
    'BS' => 'Beaver Scout',
    'CS' => 'Cub Scout',
    'S' => 'Scout',
    'ES' => 'Explorer Scout',
    'NS' => 'Network Scout',
    'AS' => 'Active Support'}
  belongs_to :organisation
  belongs_to :year
  attr_accessible :organisation, :organisation_id, :year, :year_id, :gender, :head_count, :membership_type

  def gender_text
  	GENDERS[gender]
  end
end
