require "open-uri"
# images
# profiles
file = URI.parse("https://t3.ftcdn.net/jpg/06/95/63/36/360_F_695633635_fEruwn09WukVX3T1E8jcTPj7CLte2hPx.jpg").open
file2 = URI.parse("https://t3.ftcdn.net/jpg/06/95/63/36/360_F_695633635_fEruwn09WukVX3T1E8jcTPj7CLte2hPx.jpg").open
file3 = URI.parse("https://t3.ftcdn.net/jpg/06/95/63/36/360_F_695633635_fEruwn09WukVX3T1E8jcTPj7CLte2hPx.jpg").open
file4 = URI.parse("https://t3.ftcdn.net/jpg/06/95/63/36/360_F_695633635_fEruwn09WukVX3T1E8jcTPj7CLte2hPx.jpg").open
# adventure v
adventure = URI.parse("https://cdn.outsideonline.com/wp-content/uploads/2023/04/guided-hike_h-1024x576.jpg?width=1200").open
adventure2 = URI.parse("https://www.shape.com/thmb/oAnU3qGLLeS9CDt7gceJRTo0-po=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/endurance-4d8dfc8fd70741f5a8ee810d816f52d0.jpg").open
adventure3 = URI.parse("https://www.cheshiremed.org/sites/default/files/2022-08/hiking_one_leg.jpg").open
# wellbeing v
wellbeing = URI.parse("https://upload.wikimedia.org/wikipedia/commons/e/e3/Flamingo_Spa_%26_Wellness.jpg").open
sauna1 = URI.parse("https://thermory.com/wp-content/uploads/2022/04/walls-stp-15x90-alder-benches-shp-28x90-alder-thermory-1400x933.jpg").open
sauna2 = URI.parse("https://images.everydayhealth.com/images/healthy-living/fitness/all-about-yoga-mega-722x406.jpg").open
sauna3 = URI.parse("https://advantage-physiotherapy.co.uk/wp-content/uploads/2023/02/yoga.jpg").open
# food v
food = URI.parse("https://online.jwu.edu/wp-content/uploads/2023/06/Bev20Pairing20-20tiny.jpg").open
food1 = URI.parse("https://i2.wp.com/mytravelboektje.com/wp-content/uploads/2014/11/shutterstock_761494024.jpg").open
drinks = URI.parse("https://www.touchbistro.com/wp-content/uploads/2020/05/guide-to-well-drinks-tequila-sunrise.jpg").open
drinks1 = URI.parse("https://cdn.prod.website-files.com/624c9f8a210559388107e618/6551ef9e877092b712189e64_Masskruege.jpg").open
drinks2 = URI.parse("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/62/54/ee/photo0jpg.jpg?w=1000&h=-1&s=1").open
# sport v
basket = URI.parse("https://www.codexsrl.com/wp-content/uploads/2016/09/pavimentazione-campetto-basket-codexsrl.jpg").open
basket1 = URI.parse("https://whsports.nl/en/wp-content/uploads/sites/3/2024/07/3x3-basketbal-court-Harderwijk.jpg").open
running = URI.parse("https://runkeeper.com/ja/wp-content/uploads/sites/3/2021/10/Make-Running-More-Fun-By-Varying-Your-Route.jpg").open
walking = URI.parse("https://upload.wikimedia.org/wikipedia/commons/3/3b/Amsterdam%2C_Vondelpark%2C_at_the_pond-2.jpg").open
#concert v
metal = URI.parse("https://cdn-p.smehost.net/sites/7f9737f2506941499994d771a29ad47a/wp-content/uploads/2020/02/people-having-a-concert-1190297.jpg").open
metal1 = URI.parse("https://img.freepik.com/premium-photo/crowd-going-crazy-rock-heavy-metal-concert-lot-people-mass-event-concert-crowd-hardcore-party_158001-2981.jpg").open
metal2 = URI.parse("https://flux-image.com/_next/image?url=https%3A%2F%2Fai.flux-image.com%2Fflux%2F623a2c44-c4c0-4dcc-9230-0ad1b19d5605.jpg&w=3840&q=75").open

puts "Cleaning table..."
Message.destroy_all
Booking.destroy_all
Experience.destroy_all
User.destroy_all
# storing pics
wellbeing_blob = ActiveStorage::Blob.create_and_upload!(
  io: wellbeing,
  filename: File.basename("https://upload.wikimedia.org/wikipedia/commons/e/e3/Flamingo_Spa_%26_Wellness.jpg"),
  content_type: wellbeing.content_type
)
sauna1_blob = ActiveStorage::Blob.create_and_upload!(
  io: sauna1,
  filename: File.basename("https://thermory.com/wp-content/uploads/2022/04/walls-stp-15x90-alder-benches-shp-28x90-alder-thermory-1400x933.jpg"),
  content_type: sauna1.content_type
)
sauna2_blob = ActiveStorage::Blob.create_and_upload!(
  io: sauna2,
  filename: File.basename("https://images.everydayhealth.com/images/healthy-living/fitness/all-about-yoga-mega-722x406.jpg"),
  content_type: sauna2.content_type
)
sauna3_blob = ActiveStorage::Blob.create_and_upload!(
  io: sauna3,
  filename: File.basename("https://advantage-physiotherapy.co.uk/wp-content/uploads/2023/02/yoga.jpg"),
  content_type: sauna3.content_type
)
adventure_blob = ActiveStorage::Blob.create_and_upload!(
  io: adventure,
  filename: File.basename("https://cdn.outsideonline.com/wp-content/uploads/2023/04/guided-hike_h-1024x576.jpg?width=1200"),
  content_type: adventure.content_type
)
adventure2_blob = ActiveStorage::Blob.create_and_upload!(
  io: adventure2,
  filename: File.basename("https://www.shape.com/thmb/oAnU3qGLLeS9CDt7gceJRTo0-po=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/endurance-4d8dfc8fd70741f5a8ee810d816f52d0.jpg"),
  content_type: adventure2.content_type
)
adventure3_blob = ActiveStorage::Blob.create_and_upload!(
  io: adventure3,
  filename: File.basename("https://www.cheshiremed.org/sites/default/files/2022-08/hiking_one_leg.jpg"),
  content_type: adventure3.content_type
)
walking_blob = ActiveStorage::Blob.create_and_upload!(
  io: walking,
  filename: File.basename("https://upload.wikimedia.org/wikipedia/commons/3/3b/Amsterdam%2C_Vondelpark%2C_at_the_pond-2.jpg"),
  content_type: walking.content_type
)
food_blob = ActiveStorage::Blob.create_and_upload!(
  io: food,
  filename: File.basename("https://online.jwu.edu/wp-content/uploads/2023/06/Bev20Pairing20-20tiny.jpg"),
  content_type: food.content_type
)
food1_blob = ActiveStorage::Blob.create_and_upload!(
  io: food1,
  filename: File.basename("https://i2.wp.com/mytravelboektje.com/wp-content/uploads/2014/11/shutterstock_761494024.jpg"),
  content_type: food1.content_type
)
drinks_blob = ActiveStorage::Blob.create_and_upload!(
  io: drinks,
  filename: File.basename("https://www.touchbistro.com/wp-content/uploads/2020/05/guide-to-well-drinks-tequila-sunrise.jpg"),
  content_type: drinks.content_type
)
drinks1_blob = ActiveStorage::Blob.create_and_upload!(
  io: drinks1,
  filename: File.basename("https://cdn.prod.website-files.com/624c9f8a210559388107e618/6551ef9e877092b712189e64_Masskruege.jpg"),
  content_type: drinks1.content_type
)
drinks2_blob = ActiveStorage::Blob.create_and_upload!(
  io: drinks2,
  filename: File.basename(" https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/62/54/ee/photo0jpg.jpg?w=1000&h=-1&s=1"),
  content_type: drinks2.content_type
)
basket_blob = ActiveStorage::Blob.create_and_upload!(
  io: basket,
  filename: File.basename("https://www.codexsrl.com/wp-content/uploads/2016/09/pavimentazione-campetto-basket-codexsrl.jpg"),
  content_type: basket.content_type
)
basket1_blob = ActiveStorage::Blob.create_and_upload!(
  io: basket1,
  filename: File.basename("https://whsports.nl/en/wp-content/uploads/sites/3/2024/07/3x3-basketbal-court-Harderwijk.jpg"),
  content_type: basket1.content_type
)
running_blob = ActiveStorage::Blob.create_and_upload!(
  io: running,
  filename: File.basename("https://runkeeper.com/ja/wp-content/uploads/sites/3/2021/10/Make-Running-More-Fun-By-Varying-Your-Route.jpg"),
  content_type: running.content_type
)
metal_blob = ActiveStorage::Blob.create_and_upload!(
  io: metal,
  filename: File.basename("https://cdn-p.smehost.net/sites/7f9737f2506941499994d771a29ad47a/wp-content/uploads/2020/02/people-having-a-concert-1190297.jpg"),
  content_type: metal.content_type
)
metal1_blob = ActiveStorage::Blob.create_and_upload!(
  io: metal1,
  filename: File.basename("https://img.freepik.com/premium-photo/crowd-going-crazy-rock-heavy-metal-concert-lot-people-mass-event-concert-crowd-hardcore-party_158001-2981.jpg"),
  content_type: metal1.content_type
)
metal2_blob = ActiveStorage::Blob.create_and_upload!(
  io: metal2,
  filename: File.basename("https://flux-image.com/_next/image?url=https%3A%2F%2Fai.flux-image.com%2Fflux%2F623a2c44-c4c0-4dcc-9230-0ad1b19d5605.jpg&w=3840&q=75"),
  content_type: metal2.content_type
)

puts "Creating users"
kelvin = User.new(
  username: 'kelvin',
  email: 'kelvin@gmail.com',
  password: 'topsecret',
  password_confirmation: 'topsecret'
)
kelvin.photo.attach(io: file, filename: "kelvin_profile.png", content_type: "image/png")
kelvin.save

puts "kelvin created"

james = User.new(
  username: 'james',
  email: 'james@gmail.com',
  password: 'topsecret',
  password_confirmation: 'topsecret'
)
james.photo.attach(io: file2, filename: "james_profile.png", content_type: "image/png")
james.save

puts "james created"

rodrigo = User.new(
  username: 'rodrigo',
  email: 'rodrigo@gmail.com',
  password: 'topsecret',
  password_confirmation: 'topsecret'
)
rodrigo.photo.attach(io: file3, filename: "rodrigo_profile.png", content_type: "image/png")
rodrigo.save

puts "rodrigo created"

criss = User.new(
  username: 'criss',
  email: 'criss@gmail.com',
  password: 'topsecret',
  password_confirmation: 'topsecret'
)
criss.photo.attach(io: file4, filename: "criss_profile.png", content_type: "image/png")
criss.save

puts "criss created"

john = User.new(
  username: 'johndoe',
  email: 'johndoe@gmail.com',
  password: 'topsecret',
  password_confirmation: 'topsecret'
)
john.photo.attach(io: file4, filename: "criss_profile.png", content_type: "image/png")
john.save
puts "johndoe created"

puts "Users created"

puts "Creating experiences and self booking the creator"

exp1 = Experience.new(
  max_participants: 6,
  min_participants: 3,
  user_id: kelvin.id,
  location: "Denpasar, Bali, Indonesia",
  title: "Mount Batur Hike",
  description: "Mount Batur is one of the most popular hikes near Ubud. Located an hour north of the city. 4-hour hike with stunning views and two calderas. ",
  exp_type: "adventure-sport",
  price: 45,
  date: Date.today + 5
)
exp1.photos.attach(adventure_blob)
exp1.save(validate: false)
booking = Booking.new(
  user_id: kelvin.id,
  experience_id: exp1.id
)
booking.save
puts "experience 1 created"

exp2 = Experience.new(
  max_participants: 6,
  min_participants: 3,
  user_id: kelvin.id,
  location: "Vondelpark 3, 1071 AA Amsterdam",
  title: "Walk in the Vondelpark",
  description: "Hei! I would like to invite you to join me for a nice walk in the wonderful Vondelpark, in the center of Amsterdam.
  We can also maybe go for an hot chocolate in one of the cafe in the area.",
  exp_type: "adventure-sport",
  price: 0,
  date: DateTime.new(2024,12,9,14)
)
exp2.photos.attach(walking_blob)
exp2.save(validate: false)
booking = Booking.new(
  user_id: kelvin.id,
  experience_id: exp2.id
)
booking.save
puts "experience 2 created"

exp3 = Experience.new(
  max_participants: 6,
  min_participants: 3,
  user_id: criss.id,
  location: "Johan Cruijff Boulevard 590, 1101 DS Amsterdam",
  title: "Rock concert",
  description: "There's a nice concert at Afas next week and I am going alone. It would be nice to find others rockers that would like to join, tickets are still available!",
  exp_type: "culture",
  price: 0,
  date: DateTime.new(2024,12,8,20)
)
exp3.photos.attach(metal_blob)
exp3.photos.attach(metal1_blob)
exp3.save(validate: false)
booking = Booking.new(
  user_id: criss.id,
  experience_id: exp3.id
)
booking.save

puts "experience 3 created"
exp4 = Experience.new(
  max_participants: 6,
  min_participants: 3,
  user_id: james.id,
  location: "Staalstraat 22, 1011 JM Amsterdam",
  title: "Thai dinner",
  description: "I heard of this really nice thai restaurant in Amsterdam but I'm here alone from UK.Any other thai food lover?",
  exp_type: "food-drinks",
  price: 0,
  date: DateTime.new(2024,12,8,19,30)
)
exp4.photos.attach(food1_blob)
exp4.save(validate: false)
booking = Booking.new(
  user_id: james.id,
  experience_id: exp4.id
)
booking.save
booking = Booking.new(
  user_id: criss.id,
  experience_id: exp4.id
)
booking.save
puts "experience 4 created"

exp5 = Experience.new(
  max_participants: 6,
  min_participants: 3,
  user_id: john.id,
  location: "Reguliersdwarsstraat 74, 1017 BN Amsterdam",
  title: "Cocktails night",
  description: "Anybody up for some cocktail and a chat?",
  exp_type: "food-drinks",
  price: 0,
  date: DateTime.new(2024,12,10,21,30)
)
exp5.photos.attach(drinks1_blob)
exp5.save(validate: false)
booking = Booking.new(
  user_id: john.id,
  experience_id: exp5.id
)
booking.save

booking.save
puts "experience 5 created"

exp6 = Experience.new(
  max_participants: 6,
  min_participants: 2,
  user_id: criss.id,
  location: "Cafe the Minds, Spuistraat 245, 1012 VP Amsterdam",
  title: "Beeeeers!",
  description: "I discovered this little cafe in the center, probably the last punk cafe in Amsterdam. I want to go check it out!",
  exp_type: "food-drinks",
  price: 0,
  date: DateTime.new(2024,12,8,20)
)
exp6.photos.attach(drinks2_blob)
exp6.save(validate: false)
booking = Booking.new(
  user_id: criss.id,
  experience_id: exp6.id
)
booking.save
booking = Booking.new(
  user_id: john.id,
  experience_id: exp6.id
)
booking.save
puts "experience 6 created"

exp7 = Experience.new(
  max_participants: 6,
  min_participants: 2,
  user_id: john.id,
  location: "Pazzanistraat 39, 1014 DB Amsterdam",
  title: "Running at the Westergasfabriek",
  description: "In this few days in Amsterdam I have been eating a lot(and drinking). I think having a chill run could make me feel less guilty.Join me!",
  exp_type: "adventure-sport",
  price: 0,
  date: DateTime.new(2024,12,8,14,30)
)
exp7.photos.attach(running_blob)
exp7.save(validate: false)
booking = Booking.new(
  user_id: john.id,
  experience_id: exp7.id
)
booking.save
puts "experience 7 created"

exp8 = Experience.new(
  max_participants: 5,
  min_participants: 4,
  user_id: john.id,
  location: "Hotel & Wellness Zuiver, Koenenkade 8, 1081 KH Amsterdam",
  title: "A day at the spa!",
  description: "Next week this spa near Amsterdam is having a day with a nice promotion. While in Amsterdam,I would like to take some time to relax but I don't like the idea to go there alone.",
  exp_type: "wellbeing",
  price: 35,
  date: DateTime.new(2024,12,9,14,30)
)
exp8.photos.attach(wellbeing_blob)
exp8.photos.attach(sauna1_blob)
exp8.save(validate: false)
booking = Booking.new(
  user_id: john.id,
  experience_id: exp8.id
)
booking.save
puts "experience 8 created"

exp9 = Experience.new(
  max_participants: 5,
  min_participants: 4,
  user_id: john.id,
  location: "Noordermarkt, 1015 NA Amsterdam",
  title: "Let's play basketball",
  description: "I really feel like having a small shoot around with somebody while in amsterdam.Maybe do you have a ball too? 🥺",
  exp_type: "adventure-sport",
  price: 0,
  date: DateTime.new(2024,12,7,14,30)
)
exp9.photos.attach(basket_blob)
exp9.photos.attach(basket1_blob)
exp9.save(validate: false)
booking = Booking.new(
  user_id: john.id,
  experience_id: exp9.id
)
booking.save
booking = Booking.new(
  user_id: criss.id,
  experience_id: exp9.id
)
booking.save
puts "experience 9 created"

exp9 = Experience.new(
  max_participants: 5,
  min_participants: 4,
  user_id: rodrigo.id,
  location: "Pijlsteeg 31, 1012 HH Amsterdam",
  title: "Drink and chill",
  description: "Looking for some drinking buddies to share some drinks and snacks.And late, why not, maybe some clubbing!",
  exp_type: "food-drinks",
  price: 0,
  date: DateTime.new(2024,12,8,18)
)
exp10.photos.attach(drinks_blob)
exp10.save(validate: false)
booking = Booking.new(
  user_id: john.id,
  experience_id: exp9.id
)
booking.save
booking = Booking.new(
  user_id: rodrigo.id,
  experience_id: exp10.id
)
booking.save
puts "experience 10 created"
