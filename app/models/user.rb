class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :devices, dependent: :destroy
  has_many :bookings, dependent: :restrict_with_error
  has_many :bookings, through: :devices

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def profile_photo
    if self.avatar.file.nil?
      'anon.jpg'
    else
      self.avatar.file.public_id
    end
  end
end
