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


puts 'Seeding users and potholes...'
User.destroy_all
Pothole.destroy_all


# Create users
user1 = User.create!(
  email: 'nokuthulakubk@gmail.com',
  password: 'password456',
  username: "Noks"
)
user2 = User.create!(
  email: 'jennifer.seqobane@gmail.com',
  password: 'password123',
  username: "Jen"
)
file = URI.parse("https://www.khplant.co.za/wp-content/uploads/2017/05/potholes-south-africa.jpg").open
pothole = Pothole.new(address: '22 Jesmond Road, Musgrave, Berea, Durban, South Africa',
  size: 'Large',
  description: 'A massive pothole causing traffic issues.',
  status: 'reported',
  user: user1)
pothole.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
pothole.save

file = URI.parse("https://cdn.24.co.za/files/Cms/General/d/3384/75957e02e42d40f18bc4930c6906e2b7.jpg").open
pothole = Pothole.new(address: '892 Umgeni Road, Morningside, Durban, South Africa',
  size: 'Large',
  description: 'A medium-sized pothole near the curb.',
  status: 'in progress',
  user: user1)
pothole.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
pothole.save

file = URI.parse("https://image-prod.iol.co.za/16x9/800/The-South-African-National-Roads-Agency-Limited-Sanral-has-disbursed-over-R15-million-to-motorists-for-vehicle-damage-caused-by-pothole-riddled-national-roads-File-Picture-Boxer-Ngwenya-Independent-Newspapers?source=https://iol-prod.appspot.com/image/ad0c4e17b32e22d0a54aa291eb1cac4991837a55/2000&operation=CROP&offset=0x103&resize=2000x1125").open
pothole = Pothole.new(address: '115 Musgrave road, Musgrave, Durban, South Africa',
  size: 'Small',
  description: 'A small but dangerous pothole in the middle of the road.',
  status: 'Fixed',
  user: user1)
pothole.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
pothole.save

file = URI.parse("https://www.arrivealive.co.za/ckfinder/userfiles/images/Vehicle%20Fitness%20for%20Driving%20on%20Roads%20with%20Potholes.jpg").open
pothole = Pothole.new(address: '67 Hillier Road, Umbilo, Berea, Durban, South Africa',
  size: 'Small',
  description: 'Deep pothole on a busy highway, hazardous for cars.',
  status: 'Reported',
  user: user1)
pothole.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
pothole.save


