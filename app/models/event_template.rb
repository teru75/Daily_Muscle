class EventTemplate < ApplicationRecord
  has_many :menu_templates, dependent: :destroy
end
