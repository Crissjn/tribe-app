class Experience < ApplicationRecord
  has_many_attached :photos
  has_many :bookings, dependent: :destroy
  belongs_to :user
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :exp_type, inclusion: { in: ('adventure-sport' 'food-drinks' 'eco' 'culture' 'wellbeing'),
                                    message: "%{value} is not a valid bike size" }

  validates :date, presence: true, comparison: { greater_than: Date.today }
  validates :min_participants, comparison: { greater_than: 1 },presence: true
  validates :description, length: {minimum: 10, maximum: 200},presence: true

  def full?
     self.num_partecipants == self.max_participants
  end

  def finished?
    self.date < Date.today
  end

  def can_happen?
    num_partecipants >= min_partecipants
  end

  def num_partecipants
    self.bookings.count
  end

  def booked_in?(user)
    self.bookings.where(user: user).exists?
  end

end
