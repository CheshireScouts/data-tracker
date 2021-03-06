FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password "password"
    password_confirmation "password"
  end

  factory :admin, :parent => :user do
    roles { [ FactoryGirl.create(:admin_role) ] }
  end

  factory :role do
    name { Faker::Lorem.word }
  end

  factory :admin_role, :parent => :role do
    name "Admin"
  end
end