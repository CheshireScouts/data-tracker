FactoryGirl.define do
  factory :award_type do |f|
    f.name {Faker::Name.name}
  end
end