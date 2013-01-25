class Organisation < ActiveRecord::Base
  belongs_to :organisation_type
  attr_accessible :name
end
