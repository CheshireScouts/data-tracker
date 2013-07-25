class Organisation < ActiveRecord::Base
  require 'csv'

  STATES = {'O' => 'Open', 'C' => 'Closed'}
  
  belongs_to :parent, :class_name => "Organisation"
  has_many :children, :class_name => "Organisation"
  has_many :memberships, :class_name => "Membership"
  has_many :awards, :class_name => "Award"
  has_many :composites, :class_name => "Composite"
  belongs_to :organisation_type
  attr_accessible :registration_no, :census_url_no, :name, :status, :parent, :parent_id, :organisation_type, :organisation_type_id
  has_ancestry

  validates_presence_of :registration_no, :census_url_no, :name, :status

  scope :open, where(status: 'O')

  def status_text
    STATES[status]
  end

  def self.import(file)
    unless file.nil?
      CSV.foreach(file.path, headers: true) do |row|
        record = row.to_hash
        reg = record["registration_no"]
        census = record["census_url_no"]
        name = record["name"]
        status = record["status"]
        type = OrganisationType.find_by_code(record["organisation_type"])
        parent = Organisation.find_by_registration_no(record["parent"])
        Organisation.create!(registration_no: reg, census_url_no: census, name: name, status: status, organisation_type: type, parent: parent)
      end
    end
  end

  def total_head_count_for_year(year)
  	Membership.sum(:head_count, :conditions => { :organisation_id => self, :year_id => year })
  end  	
end
