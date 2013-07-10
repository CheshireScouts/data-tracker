FactoryGirl.define do
  factory :membership_type do |f|
    f.name {Faker::Name.name}
  end
end