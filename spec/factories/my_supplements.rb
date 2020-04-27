FactoryBot.define do
  factory :my_supplement do
    name { Faker::Lorem.characters(number: 10) }
    brand { Faker::Lorem.characters(number: 10) }
    genre { Faker::Number.between(from: 0, to: 4) }
    customer
  end
end
