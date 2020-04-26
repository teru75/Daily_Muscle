class Menu < ApplicationRecord
  belongs_to :event
  has_many :reps, dependent: :destroy
  accepts_nested_attributes_for :reps, allow_destroy: true
  validates :name, presence: true, length: { maximum: 50 }
end
