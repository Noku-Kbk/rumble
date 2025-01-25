# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'Seeding users and potholes...'
User.destroy_all
Pothole.destroy_all

# Create users
user1 = User.create!(
  email: 'nokuthulakubk@gmail.com',
  password: 'password456'
)
user2 = User.create!(
  email: 'jennifer.seqobane@gmail.com',
  password: 'password123'
)

# Create potholes
Pothole.create!([
  {
    address: '22 Jesmond Road, Musgrave, Berea, Durban, South Africa',
    size: 'Large',
    description: 'A massive pothole causing traffic issues.',
    status: 'reported',
    user: user1
  },
  {
    address: '892 Umgeni Road, Morningside, Durban, South Africa',
    size: 'Medium',
    description: 'A medium-sized pothole near the curb.',
    status: 'in progress',
    user: user2
  },
  {
    address: '115 Musgrave road, Musgrave, Durban, South Africa',
    size: 'Small',
    description: 'A small but dangerous pothole in the middle of the road.',
    status: 'fixed',
    user: user1
  },
  {
    address: '67 Hillier Road, Umbilo, Berea, Durban, South Africa',
    size: 'Large',
    description: 'Deep pothole on a busy highway, hazardous for cars.',
    status: 'reported',
    user: user2
  }
])
