class Van < ApplicationRecord
  has_many :bookings
  has_one_attached :photo
  belongs_to :user
  validates :description, presence: true, length: { minimum: 20 }
  validates :location, presence: true
  validates :price_per_day, presence: true
  validates :color, presence: true
  validates :brand, presence: true
  validates :mileage, presence: true
end
