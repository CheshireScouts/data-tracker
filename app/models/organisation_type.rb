class OrganisationType < ActiveRecord::Base
  has_many :organisations, :class_name => "Organisation"
  attr_accessible :code, :name
  validates_presence_of :name
end
