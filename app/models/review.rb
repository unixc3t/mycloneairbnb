class Review < ApplicationRecord
  validates :cleanliness_rating, :accuracy_rating, :checkin_rating, :location_rating, :communication_rating, :value_rating,
 numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  belongs_to :user
  belongs_to :property, counter_cache: true

  after_commit :update_final_rating, on: [ :create, :update ]

  def update_final_rating
    total = cleanliness_rating +
      accuracy_rating +
      checkin_rating +
      communication_rating +
      location_rating +
      value_rating
    update_column(:final_rating, total.to_f/6)
  property.update_average_final_rating
  end
end
