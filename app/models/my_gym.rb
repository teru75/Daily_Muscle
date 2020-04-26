class MyGym < ApplicationRecord
  belongs_to :customer
  validates :name, presence: true, length: { maximum: 100 }
end
