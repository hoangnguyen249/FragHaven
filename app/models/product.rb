class Product < ApplicationRecord

  belongs_to :user
  # AR validations to ensure data integrity
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  has_and_belongs_to_many :categories
  has_many_attached :images
  has_many :orderables
  has_many :carts, through: :orderables

  scope :on_sale, -> { where(on_sale: true) }

  def self.new_within_three_days
    where('created_at >= ?', 3.days.ago)
  end
end