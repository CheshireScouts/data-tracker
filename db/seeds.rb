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

OrganisationType.delete_all
county = OrganisationType.create(name: 'Scout County')
district = OrganisationType.create(name: 'Scout District')
group = OrganisationType.create(name: 'Scout Group')
beavers = OrganisationType.create(name: 'Beaver Scout Section')
cubs = OrganisationType.create(name: 'Cub Scout Section')
scouts = OrganisationType.create(name: 'Scout Section')
explorers = OrganisationType.create(name: 'Explorer Scout Unit')
network = OrganisationType.create(name: 'Network Unit')
asu = OrganisationType.create(name: 'Active Support Unit')
puts 'Created Organisation Types'

Organisation.delete_all
cheshire = Organisation.new(name: 'Cheshire Scouts')
cheshire.organisation_type = county
cheshire.parent = cheshire
cheshire.save

alderley = Organisation.create(name: 'Alderley', organisation_type: district, parent: cheshire)
chester = Organisation.create(name: 'Chester', organisation_type: district, parent: cheshire)
ellesmere = Organisation.create(name: 'Ellesemere Port and Neston', organisation_type: district, parent: cheshire)
knutsford = Organisation.create(name: 'Knutsford', organisation_type: district, parent: cheshire)
macc = Organisation.create(name: 'Macclesfield and Congleton', organisation_type: district, parent: cheshire)
mersey = Organisation.create(name: 'Mersey Weaver', organisation_type: district, parent: cheshire)
mid = Organisation.create(name: 'Mid Cheshire', organisation_type: district, parent: cheshire)
sw = Organisation.create(name: 'South West Cheshire', organisation_type: district, parent: cheshire)
warringtonE = Organisation.create(name: 'Warrington East', organisation_type: district, parent: cheshire)
warringtonW = Organisation.create(name: 'Warrington West', organisation_type: district, parent: cheshire)
puts 'Created Districts'

Organisation.create(name: '1st Helsby', organisation_type: group, parent: mersey)
puts 'Created Groups'
puts 'Created Organisations'