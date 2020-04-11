class MyMenuItem < ApplicationRecord
  belongs_to :my_menu
  validates :name, presence: true, length: {in: 1..50}
end
