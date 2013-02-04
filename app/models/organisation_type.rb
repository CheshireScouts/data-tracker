class OrganisationType < ActiveRecord::Base
  has_many :organisations, :class_name => "Organisation"
  attr_accessible :code, :name
end
