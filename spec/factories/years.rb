FactoryGirl.define do
  factory :year do |f|
    sequence(:name) { |n| (2005 + n).to_s}
    f.group_census_format :factory => :census_format
    f.district_census_format :factory => :census_format
    f.county_census_format :factory => :census_format
  end

  factory :invalid_year, parent: :year do |f|
    f.name nil
  end
end