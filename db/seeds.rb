# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
Restaurant.destroy_all
CATEGORY = ["chinese", "italian", "japanese", "french", "belgian"]
10.times do |_|
  name = Faker::Name.middle_name
  address = Faker::Address.street_address
  category = CATEGORY.sample
  phone_number = Faker::PhoneNumber.phone_number_with_country_code
  restaurant = Restaurant.create!(name: name, address: address, category: category, phone_number: phone_number)
  puts "Created #{restaurant.id}"
  rand(8..15).times do |_|
    content = Faker::Quote.famous_last_words
    rating = rand(1..5)
    review = Review.create!(content: content, rating: rating, restaurant: restaurant)
  end
end

puts "Finished!"
