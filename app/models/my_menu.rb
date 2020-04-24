class MyMenu < ApplicationRecord
  belongs_to :customer
  has_many :my_menu_items, dependent: :destroy
  has_many :my_menu_likes, dependent: :destroy
  accepts_nested_attributes_for :my_menu_items, allow_destroy: true
  enum part: {whole_body: 0, upper_body: 1, arm: 2, breast: 3, shoulder: 4, back: 5, lower_body: 6, trunk: 7}
  validates :part, presence: true
  validates :theme, presence: true, length: {maximum: 100}
  def liked_by?(customer)
    my_menu_likes.where(customer_id: customer.id).exists?
  end
end
