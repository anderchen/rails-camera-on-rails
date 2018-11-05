class Device < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :brand, presence: true
  validates :model, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :is_rented, presence: true
end
