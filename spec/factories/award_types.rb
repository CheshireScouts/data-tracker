FactoryGirl.define do
  factory :award_type do |f|
    f.name {Faker::Lorem.word}
  end

  factory :invalid_award_type, parent: :award_type do |f|
    f.name nil
  end
end
