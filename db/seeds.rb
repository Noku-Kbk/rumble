# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Pothole.destroy_all
User.destroy_all
puts 'Seeding users and potholes...'

# Create users
user1 = User.create!(
  email: 'nokuthulakubk@gmail.com',
  password: 'password456'
)
user2 = User.create!(
  email: 'jennifer.seqobane@gmail.com',
  password: 'password123'
)

require "open-uri"

file = URI.parse("https://res.cloudinary.com/dva1lf16l/image/upload/v1737483236/potholes-1_mxeo94.webp").open
pothole = Pothole.new(address: '123 Main St',
size: 'Large',
description: 'A massive pothole causing traffic issues.',
status: 'reported',
user: user1)
pothole.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
pothole.save

file = URI.parse("https://res.cloudinary.com/dva1lf16l/image/upload/v1737488909/OIP_yiaozb.jpg").open
pothole = Pothole.new(address: '456 Elm St',
size: 'Medium',
description: 'A medium-sized pothole near the curb.',
status: 'In progress',
user: user2)
pothole.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
pothole.save

file = URI.parse("https://res.cloudinary.com/dva1lf16l/image/upload/v1737483040/R_mqetbj.jpg").open
pothole = Pothole.new(address: '789 Oak St',
size: 'Small',
description: 'A small but dangerous pothole in the middle of the road.',
status: 'fixed',
user: user2)
pothole.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
pothole.save

file = URI.parse("https://res.cloudinary.com/dva1lf16l/image/upload/v1737483119/OIP_miyhm6.jpg").open
pothole = Pothole.new(address: '101 Pine St',
size: 'Large',
description: 'Deep pothole on a busy highway, hazardous for cars.',
status: 'reported',
user: user1)
pothole.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
pothole.save
