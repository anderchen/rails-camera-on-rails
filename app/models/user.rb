class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :devices, dependent: :destroy
  has_many :bookings, dependent: :restrict_with_error

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :location, presence: true

  def profile_photo
    if self.avatar.file.nil?
      'anon.jpg'
    else
      self.avatar.file.public_id
    end
  end
end
