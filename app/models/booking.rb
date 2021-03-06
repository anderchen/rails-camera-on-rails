require 'date'

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :device

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user_id, presence: true
  validates :device_id, presence: true
  validate :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_before_start


  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def end_date_cannot_be_before_start
    if end_date < start_date
      errors.add(:end_date, "can't be before start date")
    end
  end
end
