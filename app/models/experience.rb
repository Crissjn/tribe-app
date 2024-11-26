class Experience < ApplicationRecord
  has_one_attached :photo
  has_many :bookings
  belongs_to :user
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :exp_type, inclusion: { in: ('adventure-sport' 'food-drinks' 'eco' 'culture' 'wellbeing'),
                                    message: "%{value} is not a valid bike size" }

  validates :date, presence: true, comparison: { greater_than: Date.today }

  def full?
     self.bookings == self.max_participants
  end

  def finished?
    self.date < Date.today
  end
end
