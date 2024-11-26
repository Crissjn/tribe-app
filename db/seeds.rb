# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

file = URI.parse("https://t3.ftcdn.net/jpg/06/95/63/36/360_F_695633635_fEruwn09WukVX3T1E8jcTPj7CLte2hPx.jpg").open

puts "Cleaning table..."
Booking.destroy_all
Experience.destroy_all
User.destroy_all

puts "Creating users"
kelvin = User.new(
  username: 'kelvin',
  email: 'kelvin@gmail.com',
  password: 'topsecret',
  password_confirmation: 'topsecret'
)
kelvin.photo.attach(io: file, filename: "profile.png", content_type: "image/pgn")
kelvin.save

james = User.new(
  username: 'james',
  email: 'james@gmail.com',
  password: 'topsecret',
  password_confirmation: 'topsecret'
)
james.photo.attach(io: file, filename: "profile.png", content_type: "image/pgn")
james.save

rodrigo = User.new(
  username: 'rodrigo',
  email: 'rodrigo@gmail.com',
  password: 'topsecret',
  password_confirmation: 'topsecret'
)
rodrigo.photo.attach(io: file, filename: "profile.png", content_type: "image/pgn")
rodrigo.save

criss = User.new(
  username: 'criss',
  email: 'criss@gmail.com',
  password: 'topsecret',
  password_confirmation: 'topsecret'
)
criss.photo.attach(io: file, filename: "profile.png", content_type: "image/pgn")
criss.save

puts "Users created"
puts "Creating experiences"
exp1 = Experience.new(
  max_participants: 5,
  min_participants: 3,
  user_id: criss.id,
  location: "Amsterdam Centraal",
  title: " A nice hike from centraal",
  description: "Open activity Let's walk together somewhere ",
  exp_type: "Hiking",
  price: 0,
  date:  DateTime.new(2024, 8, 16, 12, 30, 0),
)
exp1.save

exp2 = Experience.new(
  max_participants: 5,
  min_participants: 3,
  user_id: kelvin.id,
  location: "amsterdam sloterdijk",
  title: 'a chill drink to meet people',
  description: "Let's get a drink together and have fun with some snacks etc etcetc",
  exp_type: "beer",
  price: 10,
  date:  DateTime.new(2024, 8, 16, 20, 00, 0),
)
exp2.save
