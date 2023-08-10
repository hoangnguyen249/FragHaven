class Orderable < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  validates :product, presence: true
  validates :cart, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def total
    product.price * quantity
  end
end
