FactoryBot.define do
  factory :my_menu_item do
    name { Faker::Lorem.characters(number:10) }
    my_menu
  end
end 