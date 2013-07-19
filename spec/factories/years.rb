FactoryGirl.define do
  factory :year do |f|
    f.name {Faker::Name.name}
    f.group_census_format :factory => :census_format
    f.district_census_format :factory => :census_format
    f.county_census_format :factory => :census_format
  end

  factory :invalid_year, parent: :year do |f|
    f.name nil
  end
end