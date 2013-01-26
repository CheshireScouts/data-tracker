class Organisation < ActiveRecord::Base
  belongs_to :parent, :class_name => "Organisation"
  has_many :children, :class_name => "Organisation"
  belongs_to :organisation_type
  attr_accessible :name, :parent, :parent_id, :organisation_type, :organisation_type_id
  has_ancestry
end
