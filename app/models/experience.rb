class Experience < ApplicationRecord
  has_one_attached :photo
  has_many :bookings
  belongs_to :user

  def full?
     self.bookings == self.max_participants
  end
end
