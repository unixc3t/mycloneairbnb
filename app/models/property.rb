class Property < ApplicationRecord
  validates :name, :headline, :description, :address_1, :city, :state, :country,  presence: :true
  monetize :price_cents, allow_nil: true
  has_many_attached :images
  has_many :reviews, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  has_many :wishlisted_users, through: :wishlists, source: :user, dependent: :destroy

  has_many :reservations, dependent: :destroy
  has_many :reserved_users, through: :reservations, source: :user, dependent: :destroy

  has_rich_text :description

  def update_average_final_rating
    average_rating =reviews.average(:final_rating)
    update_column(:average_final_rating, average_rating)
  end

  def wishlisted_by?(user = nil)
    return if user.nil?

    wishlisted_users.include?(user)
  end

  def available_dates
    next_reservation = reservations.upcoming_reservations.first
    current_reservation = reservations.current_reservations.first

    if current_reservation.nil? && next_reservation.nil?
      Date.tomorrow..Date.tomorrow + 30.days
    elsif current_reservation.nil?
      Date.tomorrow..next_reservation.checkin_date
    elsif next_reservation.nil?
      current_reservation.checkout_date..current_reservation.checkout_date + 30.days
    else
      current_reservation.checkout_date..next_reservation.checkin_date
    end
  end

  def average_cleanliness_rating
    reviews.average(:cleanliness_rating).to_f
  end
  def average_accuracy_rating
    reviews.average(:accuracy_rating).to_f
  end
  def average_checkin_rating
    reviews.average(:checkin_rating).to_f
  end
  def average_communication_rating
    reviews.average(:communication_rating).to_f
  end
  def average_value_rating
    reviews.average(:value_rating).to_f
  end
  def average_location_rating
    reviews.average(:location_rating).to_f
  end
end
