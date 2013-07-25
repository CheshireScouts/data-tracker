FactoryGirl.define do
  factory :organisation do |f|
    sequence(:registration_no)
    sequence(:census_url_no)
    f.name {Faker::Lorem.word}
    f.status 'O'
    f.organisation_type factory: :organisation_type
  end

  factory :invalid_organisation, parent: :organisation do |f|
    f.name nil
  end
end