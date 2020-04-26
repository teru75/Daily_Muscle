FactoryBot.define do
  factory :event do
    part { Faker::Number.between(from: 0, to: 7) }
    customer
  end
end
