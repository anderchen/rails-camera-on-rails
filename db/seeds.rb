require 'faker'

puts "create 10 user seeds...."

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Cannabis.strain,
    first_name: Faker::Color.color_name,
    last_name: Faker::Cannabis.strain,
    location: Faker::Address.street_address
  )
  user.save!
end

puts "10 user seeds complete!!!"

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
