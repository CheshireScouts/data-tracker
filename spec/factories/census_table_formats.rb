FactoryGirl.define do
  factory :census_table_format do |f|
    f.census_format :factory => :census_format
    f.scout_type :factory => :scout_type
    f.membership_type :factory => :membership_type
  end

  factory :invalid_census_table_format, parent: :census_table_format do |f|
    f.census_format nil
  end
end