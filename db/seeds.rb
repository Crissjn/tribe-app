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
wellbeing = URI.parse("https://upload.wikimedia.org/wikipedia/commons/e/e3/Flamingo_Spa_%26_Wellness.jpg").open
culture = URI.parse("https://collegelife.co/wp-content/uploads/2022/08/153-1-1.png").open
eco = URI.parse("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJl0ThTOtheLgZYsi7APfH74COhZEXVT8b9A&s").open
food = URI.parse("https://online.jwu.edu/wp-content/uploads/2023/06/Bev20Pairing20-20tiny.jpg").open
adventure = URI.parse("https://cdn.outsideonline.com/wp-content/uploads/2023/04/guided-hike_h-1024x576.jpg?width=1200").open

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

experience_types_array = [['adventure-sport', adventure],
                          ['food-drinks', food],
                          ['eco', eco],
                          ['culture', culture],
                          ['wellbeing', wellbeing]]

puts "Users created"
puts "Creating experiences and self booking the creator"

past_exp = Experience.new(
  max_participants: 5,
  min_participants: 3,
  user_id: kelvin.id,
  location: "Amsterdam Centraal",
  title: " A nice hike from centraal",
  description: "Open activity Let's walk together somewhere ",
  exp_type: "adventure-sport",
  price: 0,
  date:  Faker::Time.between_dates(from: Date.today - 8, to: Date.today - 4 , period: :all)
)
past_exp.photos.attach(io: adventure, filename: "profile.png", content_type: "image/pgn")
past_exp.save(validate: false)
booking = Booking.new(
  user_id: kelvin.id,
  experience_id: past_exp.id
)
booking.save

past_exp2 = Experience.new(
  max_participants: 5,
  min_participants: 3,
  user_id: criss.id,
  location: "Amsterdam Centraal",
  title: " A nice hike from centraal",
  description: "Open activity Let's walk together somewhere ",
  exp_type: "adventure-sport",
  price: 0,
  date:  Faker::Time.between_dates(from: Date.today - 4, to: Date.today - 2, period: :all)
)
past_exp2.photos.attach(io: adventure, filename: "profile.png", content_type: "image/pgn")
past_exp2.save(validate: false)
booking = Booking.new(
  user_id: criss.id,
  experience_id: past_exp2.id
)
booking.save

exp1 = Experience.new(
  max_participants: 5,
  min_participants: 3,
  user_id: criss.id,
  location: "Amsterdam Centraal",
  title: " A nice hike from centraal",
  description: "Open activity Let's walk together somewhere ",

  exp_type: "adventure-sport",
  price: 0,
  date:  Faker::Time.between_dates(from: Date.today + 2, to: Date.today + 5, period: :all)
)
exp1.photos.attach(io: adventure, filename: "profile.png", content_type: "image/pgn")
exp1.save
booking = Booking.new(
  user_id: criss.id,
  experience_id: exp1.id
)
booking.save

exp2 = Experience.new(
  max_participants: 5,
  min_participants: 3,
  user_id: kelvin.id,
  location: "amsterdam sloterdijk",
  title: 'a chill drink to meet people',
  description: "Let's get a drink together and have fun with some snacks etc etcetc",
  exp_type: "food-drinks",
  price: 10,
  date:  Faker::Time.between_dates(from: Date.today + 2, to: Date.today + 6, period: :all)

)
exp2.photos.attach(io: food, filename: "profile.png", content_type: "image/pgn")
exp2.save
booking = Booking.new(
  user_id: kelvin.id,
  experience_id: exp2.id
)
booking.save

12.times do
  sample = experience_types_array.sample
  temp = Experience.new(
    max_participants: 6,
    min_participants: 3,
    user_id: kelvin.id,
    location: Faker::Address.city,
    title: Faker::Hobby.activity,
    description: "Let's get together to do something nice somewhere",
    exp_type: sample[0],
    price: rand(1..20),
    date:  Faker::Time.between_dates(from: Date.today + 2, to: Date.today + 6, period: :all)
  )
  temp.photos.attach(io: sample[1], filename: "profile.png", content_type: "image/pgn")
  temp.save
  # selfbooking the creator to the experience
  booking = Booking.new(
    user_id: kelvin.id,
    experience_id: temp.id
  )
  booking.save
end

puts "#{Experience.all.count} experiences and #{Booking.all.count} bookings created"
