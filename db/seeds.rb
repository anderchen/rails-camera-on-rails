require 'faker'

puts "create 10 user seeds...."

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Color.color_name,
    last_name: Faker::Cannabis.strain,
    location: Faker::Address.street_address
  )
  user.save!
end

puts "10 user seeds complete!!!"

10.times do
  device = Device.new(
    name: Faker::Name.name,
    description: Faker::Coffee.blend_name,
    brand: Faker::DragonBall.character,
    model: Faker::Educator.university,
    category: %w(Cameras Lens Tripods Drones Filters Lighting Accessories Other).sample,
    price: 10,
    user_id: rand(1..10)
    )
  device.save!
end

puts "10 devices seeds complete!!!"





 #Device.create!(
  #name: 'Sony A6300 Mirrorless',
  #description: 'Mirrorless Camera',
#  brand: 'Sony',
#  model: 'A6300',
  #category: 'Cameras',
#  price: 15.00,
  #is_rented: false,
  #user_id: 1
#)
