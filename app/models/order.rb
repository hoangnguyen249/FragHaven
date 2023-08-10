class Order < ApplicationRecord

  has_many :user_orders
  has_many :users, through: :user_orders
  validates_presence_of :product_id, :quantity
  validates_numericality_of :quantity, only_integer: true, greater_than: 0
end
