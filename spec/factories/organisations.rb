FactoryGirl.define do
  factory :organisation do |f|
    f.registration_no '12345'
    f.census_url_no '12345'
    f.name {Faker::Name.name}
    f.status 'Open'
    f.organisation_type :factory => :organisation_type
  end

  factory :invalid_organisation, parent: :organisation do |f|
    f.name nil
  end
end