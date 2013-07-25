FactoryGirl.define do
  factory :scout_type do |f|
    f.code {Faker::Lorem.word}
    f.name {Faker::Lorem.word}
  end

  factory :invalid_scout_type, parent: :scout_type do |f|
    f.name nil
  end
end