FactoryGirl.define do
  factory :organisation do |f|
    f.registration_no '12345'
    f.census_url_no '12345'
    f.name {Faker::Name.name}
    f.status 'Open'
    f.organisation_type :factory => :organisation_type
  end
end