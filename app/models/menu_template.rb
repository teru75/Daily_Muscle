class MenuTemplate < ApplicationRecord
  belongs_to :event_template
  validates :name, presence: true, length: {in: 1..50}
end
