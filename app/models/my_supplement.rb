class MySupplement < ApplicationRecord
  belongs_to :customer
  enum genre: {whey: 0, soy: 1, casein: 2, amino: 3, condition: 4}
  validates :name, presence: true, length: {maximum: 100}
  validates :brand, presence: true, length: {maximum: 100}
end
