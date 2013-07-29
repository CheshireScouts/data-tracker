FactoryGirl.define do
  factory :membership_type do |f|
    f.name {Faker::Lorem.word}
  end

  factory :invalid_membership_type, parent: :membership_type do |f|
    f.name nil
  end
end