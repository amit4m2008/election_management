FactoryGirl.define do
  factory :election do
    name { Faker::Name.name }
    category { Faker::Name.name }
  end
end