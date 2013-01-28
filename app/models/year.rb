class Year < ActiveRecord::Base
  has_many :memberships, :class_name => "Membership"
  attr_accessible :name
end
