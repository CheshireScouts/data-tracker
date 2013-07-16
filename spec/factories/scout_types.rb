FactoryGirl.define do
  factory :scout_type do |f|
    f.name {Faker::Name.name}
  end

  factory :invalid_scout_type, parent: :scout_type do |f|
    f.name nil
  end
end