class MyGym < ApplicationRecord
  belongs_to :customer
  validates :name, presence: true, length: {in: 1..100}
end
