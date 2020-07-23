class Event < ApplicationRecord
  belongs_to :user
  has_many :event_users
  
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true

  
end
