class Experience < ApplicationRecord
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  belongs_to :user
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :exp_type, inclusion: { in: ('adventure-sport' 'food-drinks' 'eco' 'culture' 'wellbeing'),
                                    message: "%{value} is not a valid bike size" }

  validates :date, presence: true, comparison: { greater_than: Date.today }
  validates :min_participants, comparison: { greater_than: 1 }

  def full?
     self.bookings == self.max_participants
  end

  def finished?
    self.date < Date.today
  end

  def can_happen?
    num_partecipants >= nim_partecipants
  end

  def num_partecipants
    experience.bookings.count
  end
end
