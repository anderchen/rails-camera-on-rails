class Device < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :brand, presence: true
  validates :model, presence: true
  validates :category, presence: true, inclusion: { in: %w(Cameras Lens Tripods Drones Filters Lighting Accessories Other)}
  validates :price, presence: true, format:{ with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000}
  validates :is_rented, presence: true, inclusion: {in: [true, false]}, default: false
end
