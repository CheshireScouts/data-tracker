FactoryGirl.define do
  factory :census_format do |f|
    f.name {Faker::Name.name}
    f.table_xpath '/html/body/table/tr[3]/td[1]/table/'
  end
end