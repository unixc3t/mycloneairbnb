# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

description = <<-DESCRIPTION
  <div> This file should ensure the existence of records required to run the application in every environment (production</div>
  <p> Escape to a hidden gem in the hear of nature with out beatufi fna darti perooty.</p>
DESCRIPTION


amenity_icons = [
  { name: "air_condition", icon: "air_condition.svg", description: "Air conditioning available" },
  { name: "balcony", icon: "balcony.svg", description: "Private balcony space" },
  { name: "co", icon: "co.svg", description: "Carbon monoxide alarm" },
  { name: "dedicated_work", icon: "dedicated_work.svg", description: "Dedicated workspace" },
  { name: "essentials", icon: "essentials.svg", description: "Essential toiletries provided" },
  { name: "garden", icon: "garden.svg", description: "Garden access" },
  { name: "hair_dryer", icon: "hair_dryer.svg", description: "Hair dryer" },
  { name: "hangers", icon: "hangers.svg", description: "Clothes hangers" },
  { name: "hot_water", icon: "hot_water.svg", description: "Hot water shower" },
  { name: "iron", icon: "iron.svg", description: "Iron available" },
  { name: "kitchen", icon: "kitchen.svg", description: "Full kitchen" },
  { name: "park", icon: "park.svg", description: "Nearby park" },
  { name: "private_pool", icon: "private_pool.svg", description: "Private swimming pool" },
  { name: "shampoo", icon: "shampoo.svg", description: "Shampoo provided" },
  { name: "smoke", icon: "smoke.svg", description: "Smoke alarm" },
  { name: "wifi", icon: "wifi.svg", description: "Free Wi-Fi" }
]


amenity_icons.each do |data|
   Amenity.create!(name: data[:name], icon: data[:icon], description: data[:description])
end




user = User.create!(
  email: "test1@test.com",
  password: "123456",
    name: Faker::Lorem.unique.sentence(word_count: 3),
    address_1: Faker::Address.street_address,
    address_2: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
)

user.picture.attach(io: File.open("db/images/header.jpg"), filename: user.name)

19.times do |i|
  random_user = User.create!(
    email: "test#{i + 2}@test.com",
    password: "123456",
    name: Faker::Lorem.unique.sentence(word_count: 3),
    address_1: Faker::Address.street_address,
    address_2: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
  )
  random_user.picture.attach(io: File.open("db/images/header.jpg"), filename: user.name)
end

6.times do |i|
  property = Property.create!({
    name: Faker::Lorem.unique.sentence(word_count: 3),
    description: description,
    headline: Faker::Lorem.unique.sentence(word_count: 6),
    address_1: Faker::Address.street_address,
    address_2: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    price: Money.from_amount(50, "USD"),
    bedroom_count: (2..5).to_a.sample,
    bed_count: (4..10).to_a.sample,
    bathroom_count: (2..5).to_a.sample,
    guest_count: (2..5).to_a.sample
  })
  property.images.attach(io: File.open("db/images/property_#{i + 1}.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_7.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_8.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_9.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_10.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_11.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_12.png"), filename: property.name)

  as = Set.new
  ((10..(amenity_icons.length() -1)).to_a.sample).times do
    a = Amenity.all.sample
    unless as.include?(a.id)
      property.amenities << a
      as << a.id
    end
  end

  ((5..10).to_a.sample).times do
    Review.create!(
      content: Faker::Lorem.paragraph(sentence_count: 10),
      cleanliness_rating: (1..5).to_a.sample,
      accuracy_rating: (1..5).to_a.sample,
      checkin_rating: (1..5).to_a.sample,
      location_rating: (1..5).to_a.sample,
      value_rating: (1..5).to_a.sample,
      communication_rating: (1..5).to_a.sample,
      property: property,
      user: User.all.sample
    )
  end
end
