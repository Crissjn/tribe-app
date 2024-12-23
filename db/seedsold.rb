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
file2 = URI.parse("https://t3.ftcdn.net/jpg/06/95/63/36/360_F_695633635_fEruwn09WukVX3T1E8jcTPj7CLte2hPx.jpg").open
file3 = URI.parse("https://t3.ftcdn.net/jpg/06/95/63/36/360_F_695633635_fEruwn09WukVX3T1E8jcTPj7CLte2hPx.jpg").open
file4 = URI.parse("https://t3.ftcdn.net/jpg/06/95/63/36/360_F_695633635_fEruwn09WukVX3T1E8jcTPj7CLte2hPx.jpg").open
wellbeing = URI.parse("https://upload.wikimedia.org/wikipedia/commons/e/e3/Flamingo_Spa_%26_Wellness.jpg").open
culture = URI.parse("https://collegelife.co/wp-content/uploads/2022/08/153-1-1.png").open
eco = URI.parse("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJl0ThTOtheLgZYsi7APfH74COhZEXVT8b9A&s").open
food = URI.parse("https://online.jwu.edu/wp-content/uploads/2023/06/Bev20Pairing20-20tiny.jpg").open
adventure = URI.parse("https://cdn.outsideonline.com/wp-content/uploads/2023/04/guided-hike_h-1024x576.jpg?width=1200").open
adventure2 = URI.parse("https://www.shape.com/thmb/oAnU3qGLLeS9CDt7gceJRTo0-po=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/endurance-4d8dfc8fd70741f5a8ee810d816f52d0.jpg").open
adventure3 = URI.parse("https://www.cheshiremed.org/sites/default/files/2022-08/hiking_one_leg.jpg").open

wellbeing_blob = ActiveStorage::Blob.create_and_upload!(
  io: wellbeing,
  filename: File.basename("https://upload.wikimedia.org/wikipedia/commons/e/e3/Flamingo_Spa_%26_Wellness.jpg"),
  content_type: wellbeing.content_type
)
food_blob = ActiveStorage::Blob.create_and_upload!(
  io: food,
  filename: File.basename("https://online.jwu.edu/wp-content/uploads/2023/06/Bev20Pairing20-20tiny.jpg"),
  content_type: food.content_type
)
adventure_blob = ActiveStorage::Blob.create_and_upload!(
  io: adventure,
  filename: File.basename("https://cdn.outsideonline.com/wp-content/uploads/2023/04/guided-hike_h-1024x576.jpg?width=1200"),
  content_type: adventure.content_type
)

puts "Cleaning table..."
Message.destroy_all
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
kelvin.photo.attach(io: file, filename: "kelvin_profile.png", content_type: "image/png")
kelvin.save

puts "made Kelvin"

james = User.new(
  username: 'james',
  email: 'james@gmail.com',
  password: 'topsecret',
  password_confirmation: 'topsecret'
)
james.photo.attach(io: file2, filename: "james_profile.png", content_type: "image/png")
james.save

puts "made James"

rodrigo = User.new(
  username: 'rodrigo',
  email: 'rodrigo@gmail.com',
  password: 'topsecret',
  password_confirmation: 'topsecret'
)
rodrigo.photo.attach(io: file3, filename: "rodrigo_profile.png", content_type: "image/png")
rodrigo.save

puts "made Rodrigo"

criss = User.new(
  username: 'criss',
  email: 'criss@gmail.com',
  password: 'topsecret',
  password_confirmation: 'topsecret'
)
criss.photo.attach(io: file4, filename: "criss_profile.png", content_type: "image/png")
criss.save

puts "made Criss"

experience_types_array = [['adventure-sport', adventure_blob],
                          ['food-drinks', food_blob],
                          # ['eco', eco],
                          ['culture', food_blob],
                          ['wellbeing', wellbeing_blob]]
locations_array = ["IJsbaanpad 9, 1076 CV Amsterdamn, Netherlands",
                   "Den Haag, Netherlands",
                   "Amsterdam Amstelstation",
                   "Amsterdam Bijlmer Arena",
                   "Volendam, Netherlands", "Denpasar, Bali, Indonesia"]

puts "Users created"
puts "Creating experiences and self booking the creator"

past_exp1 = Experience.new(
  max_participants: 6,
  min_participants: 3,
  user_id: kelvin.id,
  location: locations_array[5],
  title: "Mount Batur Hike",
  description: "Mount Batur is one of the most popular hikes near Ubud. Located an hour north of the city. 4-hour hike with stunning views and two calderas. ",
  exp_type: "adventure-sport",
  price: 45,
  date: Date.today
)
past_exp1.photos.attach(adventure_blob)
past_exp1.save(validate: false)
booking = Booking.new(
  user_id: kelvin.id,
  experience_id: past_exp1.id
)
booking.save

puts "past experience 1 created"

past_exp2 = Experience.new(
  max_participants: 5,
  min_participants: 3,
  user_id: kelvin.id,
  location: locations_array.sample,
  title: " A nice hike from centraal",
  description: "Open activity Let's walk together somewhere ",
  exp_type: "adventure-sport",
  price: 0,
  date:  Faker::Time.between_dates(from: Date.today - 8, to: Date.today - 4 , period: :all)
)

past_exp2.photos.attach(adventure_blob)
past_exp2.save(validate: false)

booking = Booking.new(
  user_id: kelvin.id,
  experience_id: past_exp2.id
)
booking.save

puts "past experience 2 created"

past_exp3 = Experience.new(
  max_participants: 5,
  min_participants: 3,
  user_id: criss.id,
  location: locations_array.sample,
  title: " A nice hike from centraal",
  description: "Open activity Let's walk together somewhere ",
  exp_type: "adventure-sport",
  price: 0,
  date:  Faker::Time.between_dates(from: Date.today - 4, to: Date.today - 2, period: :all)
)
past_exp3.photos.attach(adventure_blob)
past_exp3.save(validate: false)
booking = Booking.new(
  user_id: criss.id,
  experience_id: past_exp3.id
)
booking.save

puts "past experience 3 created"

exp1 = Experience.new(
  max_participants: 5,
  min_participants: 3,
  user_id: criss.id,
  location: "Madonna di campiglio",
  title: " A nice hike in the Dolomites",
  description: "Open activity Let's walk together somewhere ",

  exp_type: "adventure-sport",
  price: 0,
  date:  Faker::Time.between_dates(from: Date.today + 2, to: Date.today + 5, period: :all)
)
exp1.photos.attach(adventure_blob)
exp1.save
booking = Booking.new(
  user_id: criss.id,
  experience_id: exp1.id
)
booking.save

puts " experience 1 created"

exp2 = Experience.new(
  max_participants: 5,
  min_participants: 3,
  user_id: kelvin.id,
  location: locations_array.sample,
  title: 'a chill drink to meet people',
  description: "Let's get a drink together and have fun with some snacks etc etcetc",
  exp_type: "food-drinks",
  price: 10,
  date:  Faker::Time.between_dates(from: Date.today + 2, to: Date.today + 6, period: :all)
)
exp2.photos.attach(food_blob)
exp2.save
booking = Booking.new(
  user_id: kelvin.id,
  experience_id: exp2.id
)
booking.save

puts " experience 1 created"

puts " creating now 15 random experiences"
15.times do
  sample = experience_types_array.sample
  temp = Experience.new(
    max_participants: 6,
    min_participants: 3,
    user_id: kelvin.id,
    location: locations_array.sample,
    title: Faker::Hobby.activity,
    description: "Let's get together to do something nice somewhere",
    exp_type: sample[0],
    price: rand(1..20),
    date:  Faker::Time.between_dates(from: Date.today + 2, to: Date.today + 6, period: :all)
  )
  temp.photos.attach(food_blob)
  temp.save
  # selfbooking the creator to the experience
  booking = Booking.new(
    user_id: kelvin.id,
    experience_id: temp.id
  )
  booking.save
end

puts "#{Experience.all.count} experiences and #{Booking.all.count} bookings created"
