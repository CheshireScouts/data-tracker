FactoryGirl.define do
  factory :organisation_type do |f|
    f.name {Faker::Name.name}
  end

  factory :invalid_organisation_type, parent: :organisation_type do |f|
    f.name nil
  end
end