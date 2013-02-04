class Year < ActiveRecord::Base
  has_many :memberships, :class_name => "Membership"
  belongs_to :census_format
  attr_accessible :name, :census_format, :census_format_id
end
