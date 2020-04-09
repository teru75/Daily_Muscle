class Group < ApplicationRecord
  has_many :customers, through: :group_customers
  has_many :group_customers
  accepts_nested_attributes_for :group_customers
end
