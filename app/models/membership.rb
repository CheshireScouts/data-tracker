class Membership < ActiveRecord::Base
  require 'csv'
  
  GENDERS = {'M' => 'Male', 'F' => 'Female'}
  belongs_to :organisation
  belongs_to :year
  belongs_to :membership_type
  belongs_to :scout_type
  attr_accessible :organisation, :organisation_id, :year, :year_id, :gender, :head_count, :membership_type, :membership_type_id, :scout_type, :scout_type_id

  def gender_text
  	GENDERS[gender]
  end

  def self.generate_csv(organisation = Organisation.find_by_registration_no("00108"))
    organisations = Organisation.subtree_of(organisation)
    CSV.generate do |csv|
      csv << ["membership_type", "year", "scout_type", "gender", "head_count"]
      organisations.each do |o|
        o.memberships.each do |m|
          csv << [m.membership_type.name, m.year.name, m.scout_type.name, m.gender, m.head_count.to_s]
        end
      end
    end
  end
  
end
