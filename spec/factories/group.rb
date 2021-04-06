FactoryGirl.define do
  factory :group do
    description { Faker::Lorem }
    name { Faker::Name.name }
  end
end