class Organisation < ActiveRecord::Base
  require 'csv'
  
  belongs_to :parent, :class_name => "Organisation"
  has_many :children, :class_name => "Organisation"
  has_many :memberships, :class_name => "Membership"
  has_many :awards, :class_name => "Award"
  has_many :composites, :class_name => "Composite"
  belongs_to :organisation_type
  attr_accessible :registration_no, :name, :parent, :parent_id, :organisation_type, :organisation_type_id
  has_ancestry

  def self.import(file)
    unless file.nil?
      CSV.foreach(file.path, headers: true) do |row|
        record = row.to_hash
        reg = record["registration_no"]
        name = record["name"]
        type = OrganisationType.find_by_code(record["organisation_type"])
        parent = Organisation.find_by_registration_no(record["parent"])
        Organisation.create!(registration_no: reg, name: name, organisation_type: type, parent: parent)
      end
    end
  end

  def total_head_count_for_year(year)
  	Membership.sum(:head_count, :conditions => { :organisation_id => self, :year_id => year })
  end  	
end
