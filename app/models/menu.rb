class Menu < ApplicationRecord
  belongs_to :event
  has_many :reps, dependent: :destroy
  accepts_nested_attributes_for :reps, allow_destroy: true
end
