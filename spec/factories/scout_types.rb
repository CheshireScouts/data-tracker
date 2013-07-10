FactoryGirl.define do
  factory :scout_type do |f|
    f.name {Faker::Name.name}
  end
end