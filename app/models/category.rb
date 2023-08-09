class Category < ActiveRecord::Base
  has_and_belongs_to_many :products
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end
end