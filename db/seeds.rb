# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

AwardType.delete_all
AwardType.create(code: 'BRONZE', name: 'Chief Scout\'s Bronze Award')
AwardType.create(code: 'SILVER', name: 'Chief Scout\'s Silver Award')
AwardType.create(code: 'GOLD', name: 'Chief Scout\'s Gold Award')
AwardType.create(code: 'DIAMOND', name: 'Chief Scout\'s Diamond Award')
AwardType.create(code: 'PLATINUM', name: 'Chief Scout\'s Platinum Award')
AwardType.create(code: 'QUEEN', name: 'Queen\'s Scout Award')
puts 'Created Award Types'

ScoutType.delete_all
beavers = ScoutType.create!(code: 'BEAVERS', name: 'Beaver Scouts')
cubs = ScoutType.create!(code: 'CUBS', name: 'Cub Scouts')
scouts = ScoutType.create!(code: 'SCOUTS', name: 'Scouts')
explorers = ScoutType.create!(code: 'EXPLORERS', name: 'Explorer Scouts')
network = ScoutType.create!(code: 'NETWORK', name: 'Network Scouts')
support = ScoutType.create!(code: 'SUPPORT', name: 'Active Support')
leaders = ScoutType.create!(code: 'LEADERS', name: 'Leaders')
assistant = ScoutType.create!(code: 'ASSISTANT', name: 'Sectional Assistants and Skills Instructors')
other = ScoutType.create!(code: 'OTHER', name: 'Other Adults')
puts 'Created Scout Types'

MembershipType.delete_all
member = MembershipType.create!(code: 'M', name: 'Member')
associate = MembershipType.create!(code: 'A', name: 'Associate Member')
puts 'Created Membership Types'

OrganisationType.delete_all
county = OrganisationType.create(code: 'COUNTY', name: 'Scout County')
district = OrganisationType.create(code: 'DISTRICT', name: 'Scout District')
group = OrganisationType.create(code: 'GROUP', name: 'Scout Group')
explorers = OrganisationType.create(code: 'ESU', name: 'Explorer Scout Unit')
network = OrganisationType.create(code: 'NETWORK', name: 'Network Unit')
asu = OrganisationType.create(code: 'ASU', name: 'Active Support Unit')
puts 'Created Organisation Types'

CensusFormat.delete_all
group_format_2005 = CensusFormat.create(name: '2005 Group Format', table_xpath: '/html/body/table/tr[3]/td[1]/table/')
puts 'Created Census Formats'

CensusTableFormat.delete_all
CensusTableFormat.create(census_format: group_format_2005, scout_type: beavers, membership_type: member, row: 5, column: 8)
CensusTableFormat.create(census_format: group_format_2005, scout_type: cubs, membership_type: member, row: 7, column: 8)
CensusTableFormat.create(census_format: group_format_2005, scout_type: scouts, membership_type: member, row: 9, column: 9)
CensusTableFormat.create(census_format: group_format_2005, scout_type: leaders, membership_type: member, row: 11, column: 9)
CensusTableFormat.create(census_format: group_format_2005, scout_type: assistant, membership_type: member, row: 13, column: 8)
CensusTableFormat.create(census_format: group_format_2005, scout_type: support, membership_type: member, row: 15, column: 4)
CensusTableFormat.create(census_format: group_format_2005, scout_type: other, membership_type: member, row: 18, column: 4)
CensusTableFormat.create(census_format: group_format_2005, scout_type: support, membership_type: associate, row: 16, column: 3)
CensusTableFormat.create(census_format: group_format_2005, scout_type: other, membership_type: associate, row: 19, column: 3)
puts 'Created Census Table Formats'

Year.delete_all
Year.create(name: 2001)
Year.create(name: 2002)
Year.create(name: 2003)
Year.create(name: 2004)
Year.create(name: 2005, census_format: group_format_2005)
Year.create(name: 2006, census_format: group_format_2005)
Year.create(name: 2007, census_format: group_format_2005)
Year.create(name: 2008, census_format: group_format_2005)
Year.create(name: 2009, census_format: group_format_2005)
Year.create(name: 2010, census_format: group_format_2005)
Year.create(name: 2011, census_format: group_format_2005)
Year.create(name: 2012, census_format: group_format_2005)
Year.create(name: 2013, census_format: group_format_2005)
puts 'Created Years'

Organisation.delete_all
Organisation.create(registration_no: '00108', name: 'Cheshire Scouts', organisation_type: county)
puts 'Created Cheshire Scouts'

