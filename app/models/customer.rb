class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, dependent: :destroy
  has_many :my_supplements, dependent: :destroy
  has_many :my_menus, dependent: :destroy
  has_many :my_gyms, dependent: :destroy
  has_many :event_likes, dependent: :destroy
  has_many :my_menu_likes, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_customer, through: :follower, source: :followed
  has_many :follower_customer, through: :followed, source: :follower

  attachment :profile_image
  
  validates :name, presence: true, length: {in: 2..50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  def follow(customer_id)
    follower.create(followed_id: customer_id)
  end

  def unfollow(customer_id)
    follower.find_by(followed_id: customer_id).destroy
  end

  def following?(customer)
    following_customer.include?(customer)
  end

end
