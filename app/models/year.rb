class Year < ActiveRecord::Base
  has_many :memberships, :class_name => "Membership"
  belongs_to :group_census_format, :class_name => "CensusFormat"
  belongs_to :district_census_format, :class_name => "CensusFormat"
  belongs_to :county_census_format, :class_name => "CensusFormat"
  attr_accessible :name, :group_census_format, :group_census_format_id, :district_census_format, :district_census_format_id, :county_census_format, :county_census_format_id

  validates_presence_of :name, :group_census_format, :district_census_format, :county_census_format
end
