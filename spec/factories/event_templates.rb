FactoryBot.define do
  factory :event_template do
    part { Faker::Number.between(from: 0, to: 7) }
    theme { Faker::Lorem.characters(number:10) }
  end
end 