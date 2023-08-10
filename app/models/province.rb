class Province < ApplicationRecord
  has_many :users
  validates :name, presence: true
  validates :pst, :gst, :hst, presence: true, numericality: true
end
