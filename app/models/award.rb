class Award < ActiveRecord::Base
  belongs_to :organisation
  belongs_to :year
  belongs_to :award_type
  attr_accessible :organisation, :organisation_id, :year, :year_id, :award_type, :award_type_id, :award_count
end
