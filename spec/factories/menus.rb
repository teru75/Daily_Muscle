FactoryBot.define do
  factory :menu do
    name { Faker::Lorem.characters(number: 10) }
    event
  end
end
