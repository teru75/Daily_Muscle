FactoryBot.define do
  factory :menu_template do
    name { Faker::Lorem.characters(number:10) }
    event_template
  end
end 