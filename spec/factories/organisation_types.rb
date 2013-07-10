FactoryGirl.define do
  factory :organisation_type do |f|
    f.name {Faker::Name.name}
  end
end