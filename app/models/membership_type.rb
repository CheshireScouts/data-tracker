class MembershipType < ActiveRecord::Base
  has_many :memberships, :class_name => "Membership"
  attr_accessible :name
  validates_presence_of  :name
end
