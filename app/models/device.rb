class Device < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :restrict_with_error

  validates :name, presence: true
  validates :description, presence: true
  validates :brand, presence: true
  validates :model, presence: true
  validates :category, presence: true, inclusion: { in: %w(Cameras Lens Tripods Drones Filters Lighting Accessories Other)}
  validates :price, presence: true, numericality: true
  validates :is_rented, default: false

  include PgSearch
  pg_search_scope :search_by_name_category_brand_model,
    against:[
      [:name, 'A'],
      [:category,'B'],
      [:brand,'C'],
      [:model, 'D']
    ],
    using: {
      tsearch: {prefix: true}
    }
end

