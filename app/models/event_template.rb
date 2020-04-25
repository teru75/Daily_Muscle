class EventTemplate < ApplicationRecord
  has_many :menu_templates, dependent: :destroy
  accepts_nested_attributes_for :menu_templates, allow_destroy: true
  enum part: {whole_body: 0, upper_body: 1, arm: 2, breast: 3, shoulder: 4, back: 5, lower_body: 6, trunk: 7}
  validates :part, presence: true
  validates :theme, presence: true, length: {maximum: 100}
  validates :introduction, presence: true
end
