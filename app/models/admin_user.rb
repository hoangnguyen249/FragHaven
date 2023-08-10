class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates_presence_of :email, :encrypted_password
  validates_uniqueness_of :email
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
         def self.ransackable_attributes(auth_object = nil)
          ["created_at", "email", "encrypted_password", "id", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
        end
end
