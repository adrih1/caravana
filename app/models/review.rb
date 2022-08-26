class Review < ApplicationRecord
  AUTHORIZED_RATINGS = (1..5)
  belongs_to :booking
  validates :rating, inclusion: { in: AUTHORIZED_RATINGS }
  validates :content, presence: true, length: { minimum: 10 }
end
