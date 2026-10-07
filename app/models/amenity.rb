class Amenity < ApplicationRecord
  validates :name, :description, presence: :true
  validates :name, uniqueness: true
  has_one_attached :icon

  has_many :property_amenities, dependent: :destroy
end
