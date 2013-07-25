FactoryGirl.define do
  factory :organisation_type do |f|
    f.code {Faker::Lorem.word}
    f.name {Faker::Lorem.word}
  end

  factory :invalid_organisation_type, parent: :organisation_type do |f|
    f.name nil
  end
end