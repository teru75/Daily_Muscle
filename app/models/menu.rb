class Menu < ApplicationRecord
  belongs_to :event, inverse_of: :menus
  has_many :reps, dependent: :destroy, inverse_of: :menu
  accepts_nested_attributes_for :reps, allow_destroy: true
  validates_associated :reps
  validates :name, presence: true, length: { maximum: 50 }
end
