class MembershipType < ActiveRecord::Base
  has_many :memberships, :class_name => "Membership"
  attr_accessible :code, :name
  validates_presence_of :code, :name
end
