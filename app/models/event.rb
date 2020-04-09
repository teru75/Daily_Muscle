class Event < ApplicationRecord
  belongs_to :customer
  has_many :menus, dependent: :destroy
  accepts_nested_attributes_for :menus, allow_destroy: true
  has_many :event_likes, dependent: :destroy
  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end
end
