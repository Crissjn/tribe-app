class Experience < ApplicationRecord
  has_one_attached :photo
  has_many :bookings
  belongs_to :user
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def full?
     self.bookings == self.max_participants
  end
end
