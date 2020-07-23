class User < ApplicationRecord
  has_secure_password
  has_many :events
  has_many :event_users

  validates :email, presence: true, uniqueness: true
end
