class CensusTableFormat < ActiveRecord::Base
  belongs_to :census_format
  belongs_to :scout_type
  belongs_to :membership_type
  attr_accessible :census_format, :census_format_id, :scout_type, :scout_type_id, :membership_type, :membership_type_id, :column, :row

  validates_presence_of :census_format, :scout_type, :membership_type
end
