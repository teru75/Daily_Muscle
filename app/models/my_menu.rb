class MyMenu < ApplicationRecord
  belongs_to :customer
  has_many :my_menu_items, dependent: :destroy
end
