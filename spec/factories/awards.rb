FactoryGirl.define do
  factory :award do |f|
    f.organisation :factory => :organisation
    f.year :factory => :year
    f.award_type :factory => :award_type
    f.scout_type :factory => :scout_type
  end
end