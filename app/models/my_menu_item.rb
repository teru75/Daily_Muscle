class MyMenuItem < ApplicationRecord
  belongs_to :my_menu
  belongs_to :customer
  validates :name, presence: true, length: {maximum: 50}
end
