class Award < ActiveRecord::Base
  require 'csv'
  
  belongs_to :organisation
  belongs_to :year
  belongs_to :award_type
  belongs_to :scout_type
  attr_accessible :organisation, :organisation_id, :year, :year_id, :award_type, :award_type_id, :award_count, :scout_type, :scout_type_id

  validates_presence_of :organisation, :year, :award_type, :scout_type

  def self.import(file)
    unless file.nil?
      CSV.foreach(file.path, headers: true) do |row|
        record = row.to_hash
        organisation = Organisation.find_by_registration_no(record["organisation"])
        year = Year.find_by_name(record["year"])
        award_type = AwardType.find_by_name(record["award_type"])
        scout_type = ScoutType.find_by_name(record["scout_type"])
        award_count = record["award_count"]
        Award.create(
          organisation: organisation, 
          year: year, 
          award_type: award_type, 
          scout_type: scout_type, 
          award_count: award_count)
      end
    end
  end

end
