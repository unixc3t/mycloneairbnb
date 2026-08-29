class Property < ApplicationRecord
  validates :name, :headline, :description, :address_1, :city, :state, :country,  presence: :true
end
