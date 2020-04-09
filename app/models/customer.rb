class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, dependent: :destroy
  has_many :my_supplements, dependent: :destroy
  has_many :my_menus, dependent: :destroy
  has_many :my_gyms, dependent: :destroy
  has_many :groups, through: :group_customers
  has_many :group_customers
  has_many :event_likes, dependent: :destroy
  has_many :my_menu_likes, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_customer, through: :follower, source: :followed
  has_many :follower_customer, through: :followed, source: :follower
  attachment :profile_image
end
