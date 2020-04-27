FactoryBot.define do
  factory :my_gym do
    name { Faker::Lorem.characters(number: 10) }
    customer
  end
end
