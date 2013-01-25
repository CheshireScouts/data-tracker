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
OrganisationType.create(name: 'Scout Group')
OrganisationType.create(name: 'Beaver Scout Section')
OrganisationType.create(name: 'Cub Scout Section')
OrganisationType.create(name: 'Scout Section')
OrganisationType.create(name: 'Explorer Scout Section')
puts 'Created Organisation Types'

Organisation.delete_all
cheshire = Organisation.new(name: 'Cheshire Scouts')
cheshire.organisation_type = county
cheshire.parent = cheshire
cheshire.save

mersey = Organisation.new(name: 'Mersey Weaver')
mersey.organisation_type = district
mersey.parent = cheshire
mersey.save
puts 'Created Organisations'