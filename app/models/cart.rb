class Cart < ApplicationRecord
  has_many :orderables
  has_many :products, through: :orderables
  belongs_to :user
  validates_presence_of :user_id
  def total
    orderables.to_a.sum { |orderable| orderable.total}
  end
end
