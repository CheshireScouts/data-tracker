FactoryGirl.define do
  factory :membership do |f|
    f.gender { ['M', 'F'].sample }
    f.organisation :factory => :organisation
    f.year :factory => :year
    f.membership_type :factory => :membership_type
    f.scout_type :factory => :scout_type
    f.head_count Random.rand(30)
  end

  factory :invalid_membership, parent: :membership do |f|
    f.organisation nil
  end
end