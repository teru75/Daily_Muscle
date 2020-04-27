class MenuTemplate < ApplicationRecord
  belongs_to :event_template
  validates :name, presence: true, length: { maximum: 50 }
end
