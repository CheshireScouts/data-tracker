class Composite < ActiveRecord::Base
  belongs_to :organisation
  belongs_to :year
  belongs_to :scout_type
  attr_accessible :organisation, :organisation_id, :year, :year_id, :scout_type, :scout_type_id, :head_count, :award_count
end
