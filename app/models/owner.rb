class Owner < ApplicationRecord
  has_many :events
  
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
