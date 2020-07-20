class Event < ApplicationRecord
  belongs_to :owner
  
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true

  
end
