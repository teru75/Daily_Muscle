class Rep < ApplicationRecord
  belongs_to :menu, inverse_of: :reps
  validates :weight, presence: true
  validates :count, presence: true
  validates :set_count, presence: true
end
