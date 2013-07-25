FactoryGirl.define do
  factory :census_format do |f|
    f.name {Faker::Lorem.word}
    f.table_xpath '/html/body/table/tr[3]/td[1]/table/'
  end

  factory :invalid_census_format, parent: :census_format do |f|
    f.name nil
  end
end