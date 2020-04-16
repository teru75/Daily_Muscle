class Event < ApplicationRecord
  belongs_to :customer
  has_many :menus, dependent: :destroy
  accepts_nested_attributes_for :menus, allow_destroy: true
  enum part: {whole_body: 0, upper_body: 1, arm: 2, breast: 3, shoulder: 4, back: 5, lower_body: 6, trunk: 7}
  validates :part, presence: true
  validates :start, presence: true
  validates :end, presence: true
  has_many :event_likes, dependent: :destroy
  def liked_by?(customer)
    event_likes.where(customer_id: customer.id).exists?
  end
end
