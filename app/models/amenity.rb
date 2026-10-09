class Amenity < ApplicationRecord
  validates :name, :description, presence: :true
  validates :name, uniqueness: true
  validates :icon,  presence: :true

  has_many :property_amenities, dependent: :destroy
end
