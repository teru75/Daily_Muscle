class MySupplement < ApplicationRecord
  belongs_to :customer
  enum genre: {whey: 0, soy: 1, casein: 2, amino: 3, condition: 4}
  validates :name, presence: true, length: {in: 1..100}
  validates :brand, presence: true, length: {in: 1..100}
end
