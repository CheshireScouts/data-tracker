class Membership < ActiveRecord::Base
  require 'csv'
  
  GENDERS = {'M' => 'Male', 'F' => 'Female'}
  belongs_to :organisation
  belongs_to :year
  belongs_to :membership_type
  belongs_to :scout_type
  attr_accessible :organisation, :organisation_id, :year, :year_id, :gender, :head_count, :membership_type, :membership_type_id, :scout_type, :scout_type_id

  validates_presence_of :organisation, :year, :membership_type, :scout_type, :gender, :head_count
  validates_inclusion_of :gender, in: GENDERS

  def gender_text
  	GENDERS[gender]
  end

  
  
end
