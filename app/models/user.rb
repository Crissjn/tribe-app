class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_one_attached :photo

  has_many :bookings
  has_many :experiences

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  before_create :set_default_photo

  private

  def set_default_photo
    unless photo.attached?
      photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_avatar.jpg')),
                                 filename:'default_avatar.jpg',
                                 content_type:'image/jpg')
    end
  end
end
