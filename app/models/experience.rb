class Experience < ApplicationRecord
  has_many_attached :photos
  has_many :bookings, dependent: :destroy
  belongs_to :user
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :exp_type, inclusion: { in: ('wellbeing' 'culture' 'adventure' 'sport' 'nature' 'food-drink' 'nightlife' 'volunteer') }

  validates :date, presence: true, comparison: { greater_than: Date.today }
  validates :min_participants, comparison: { greater_than: 1 }, presence: true
  validates :description, length: { minimum: 10, maximum: 200 }, presence: true
  validates :photos, presence: { message: "Please upload a photo!" }, if: :photo_required?

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

  private

  def photo_required?
    new_record? || photos.attached? == false
  end
end
