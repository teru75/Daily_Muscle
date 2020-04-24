class MyMenuItem < ApplicationRecord
  belongs_to :my_menu
  validates :name, presence: true, length: {maximum: 50}
end
