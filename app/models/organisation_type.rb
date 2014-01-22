class OrganisationType < ActiveRecord::Base
  has_many :organisations, :class_name => "Organisation"
  attr_accessible :name
  validates_presence_of :name
end
