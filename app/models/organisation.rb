class Organisation < ActiveRecord::Base
  belongs_to :parent, :class_name => "Organisation"
  has_many :children, :class_name => "Organisation"
  has_many :memberships, :class_name => "Membership"
  belongs_to :organisation_type
  attr_accessible :name, :parent, :parent_id, :organisation_type, :organisation_type_id
  has_ancestry

  def total_head_count_for_year(year)
  	Membership.sum(:head_count, :conditions => { :organisation_id => self, :year_id => year })
  end  	
end
