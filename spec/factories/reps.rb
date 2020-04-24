FactoryBot.define do
  factory :rep do
    weight { Faker::Number.decimal(l_digits: 2) }
    count { Faker::Number.between(from: 1, to: 10) }
    set_count { Faker::Number.between(from: 0, to: 4) }
    menu
  end
end 