require 'faker'

puts "create 10 user seeds...."

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    first_name: %w(Bob Maria John Ana Mark Jane).sample,
    last_name: %w(Smith Goldman Silva Harold Kumar).sample,
    location: %w("Rua Mourato Coelho, 1404", "Avenida Paulista, 1000", "Rua da Mooca, 436", "Avenida Brigadeiro Faria Lima, 500").sample
  )
  user.save!
end

puts "10 user seeds complete!!!"

10.times do
  device = Device.new(
    name: %w(Leica Red Light Medion Pentax Lytro).sample,
    description: "Best equipment in the market",
    brand: %w(Sony Canon Nikon Fujifilm).sample,
    model: ('A'..'Z').to_a.sample + rand(1..1000).to_s,
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
