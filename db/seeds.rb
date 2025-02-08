require "open-uri"
puts "start"
User .destroy_all
Pothole.destroy_all
Room.destroy_all

User .create!([
  { id: 20, name: "Jennifer", email: "jennifer.seqobane@gmail.com", password: "123456" },
  { id: 21, name: "Nokuthula", email: "nokuthulakubk@gmail.com", password: "123456" },
  { id: 22, name: "Michael Brown", email: "mikebrown@gmail.com", password: "123456" }
])

puts "Creating potholes..."

potholes_data = [
  { id: 40, address: "22 Jesmond Road, Musgrave, Berea, Durban, South Africa", size: "Large", description: "A massive pothole causing traffic issues.", status: "reported", user_id: 20, latitude: -29.839474, longitude: 30.994302, photo: "https://www.santam.co.za/media/dk0actob/how-south-africa-s-farmers-can-navigate-costly-pothole-damage-shutterstock_1269620845.jpg" },
  { id: 50, address: "14 Queen Nandi Drive, Newlands, Durban, South Africa", size: "Medium", description: "Pothole right at a speed bump, making it difficult to navigate without damaging tires.", status: "In progress", user_id: 20, latitude: -29.794361, longitude: 31.012119, photo: "https://s43365.pcdn.co/wp-content/uploads/2024/01/POTH1-1.png" },
  { id: 41, address: "892 Umgeni Road, Morningside, Durban, South Africa", size: "Large", description: "A medium-sized pothole near the curb.", status: "in progress", user_id: 20, latitude: -29.823233, longitude: 31.027092, photo: "https://www.khplant.co.za/wp-content/uploads/2017/05/potholes-south-africa.jpg" },
  { id: 42, address: "115 Musgrave road, Musgrave, Durban, South Africa", size: "Small", description: "A small but dangerous pothole in the middle of the road.", status: "Fixed", user_id: 20, latitude: -29.848641, longitude: 30.999034, photo: "https://cdn.24.co.za/files/Cms/General/d/3384/75957e02e42d40f18bc4930c6906e2b7.jpg" },
  { id: 43, address: "67 Hillier Road, Umbilo, Berea, Durban, South Africa", size: "Small", description: "Deep pothole on a busy highway, hazardous for cars.", status: "Reported", user_id: 20, latitude: -29.883368, longitude: 30.98254, photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2Hu8F4637jrB7T8a9X1TRrbu0N6nxqzgpZg&s" },
  { id: 51, address: "8 Lighthouse Road, Umhlanga Rocks, Durban, South Africa", size: "Large", description: "A growing sinkhole-like pothole near the beach road, causing concern among locals.", status: "In Progress", user_id: 20, latitude: -29.725519, longitude: 31.083967, photo: "https://www.dsclaw.co.za/wp-content/uploads/road-accidents-caused-by-potholes-in-south-africa.jpg" },
  { id: 44, address: "12 Florida Road, Morningside, Durban, South Africa", size: "Small", description: "Several small potholes forming in a row, making this busy street difficult to navigate.", status: "In progress", user_id: 20, latitude: -29.838157, longitude: 31.018352, photo: "https://images.squarespace-cdn.com/content/v1/573365789f726693272dc91a/1704992146415-CI272VYXPALWT52IGLUB/AdobeStock_201419293.jpeg?format=1500w" },
  { id: 45, address: "22 Intersite Avenue, Springfield, Durban, South Africa", size: "Large", description: "Shallow but wide pothole that fills with water after rain, making it hard to detect.", status: "In progress", user_id: 20, latitude: -29.812395, longitude: 30.998311, photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlxEP7-XG4BCTqI7tQ6QDd2bROE361ZBB6eB-jLogzI-rYeChliCkzN686sRokQWVexiM&usqp=CAU" },
  { id: 46, address: "89 Jan Smuts Highway, Mayville, Durban, South Africa", size: "Medium", description: "A massive pothole on the left lane, forcing drivers to change lanes unexpectedly.", status: "Report", user_id: 20, latitude: -29.850731, longitude: 30.986294, photo: "https://ca-times.brightspotcdn.com/dims4/default/f30e517/2147483647/strip/true/crop/1799x1368+0+0/resize/1200x913!/quality/75/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F47%2Fe9%2Fd567b3084ed889c8e275ab2f25ab%2Fla-me-pothole-western-sixth-los-angeles.jpg" },
  { id: 52, address: "11 New Germany Road, Pinetown, Durban, South Africa", size: "Small", description: "Series of small potholes forming into one large depression, making driving rough.", status: "Done", user_id: 20, latitude: -29.826544, longitude: 30.928252, photo: "https://fleetwatch.co.za/wp-content/uploads/2021/05/Monster-pothole.jpg" },
  { id: 47, address: "35 Essenwood Road, Musgrave, Durban, South Africa", size: "Medium", description: "Several medium-sized potholes close to a pedestrian crossing, posing a risk to both vehicles and pedestrians.", status: "Done", user_id: 20, latitude: -29.847986, longitude: 30.997632, photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRG97L7OwpbK-EPVwrxDqUTgWQKazaiiZFb_0zcbJk0bzLkqSH_lD0SwxgYAXQxyWbQnwg&usqp=CAU" },
  { id: 48, address: "56 Northway, Durban North, Durban, South Africa", size: "Large", description: "Deep pothole at the entrance of a shopping center, leading to multiple vehicle damages.", status: "In progress", user_id: 20, latitude: -29.783969, longitude: 31.036516, photo: "https://image-prod.iol.co.za/16x9/8esize=2000x1125" },
  { id: 49, address: "103 Bellair Road, Cato Manor, Durban, South Africa", size: "Small", description: "Expanding pothole due to heavy truck traffic, worsening after recent rains.", status: "Reported", user_id: 20, latitude: -29.86716, longitude: 30.964908, photo: "https://potholerepairs.co.za/assets/uploads/media-uploader/pothole-header-11661784038.jpg" },
  { id: 53, address: "5 Rossburgh Drive, Rossburgh, Durban, South Africa", size: "Large", description: "Deep pothole on a downhill slope, increasing the risk of vehicle suspension damage.", status: "Reported", user_id: 20, latitude: -29.898333, longitude: 30.9725, photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0AtLC2ppOWQQYCXFhb1macDJ-1DfNymtrxbjgYUT12l1eKrFHDQJEaQV829cgDiDY60k&usqp=CAU" },
  { id: 54, address: "99 Montclair Road, Montclair, Durban, South Africa", size: "Large", description: "Pothole forming near a bus stop, causing delays and disruptions in public transport.", status: "In progress", user_id: 20, latitude: -29.92225, longitude: 30.969531, photo: "https://lh3.googleusercontent.com/cr2jg8JYbadYR8c6_praoZ0T4eh_V97BfQP9f6D5T8xcjFIjCKCMb-IJGtpw2XLbOSDhgAUUTISa7oPo-z24tw=s1500-pp" },
  { id: 55, address: "39 Garth Road, Mayville, Durban, South Africa", size: "Small", description: "Small pothole.", status: "In progress", user_id: 20, latitude: -29.842755, longitude: 30.981782, photo: "https://lh3.googleusercontent.com/NOMSuwhETe8islIqYot9CNqA44bkPZE1qs5IxiK6TcNeiytfeKVvx33LbYEltin2tNcfzBUrkrkSsSFdc-gzP-s=s1000" }
]

potholes_data.each do |pothole_data|
  pothole = Pothole.create!(pothole_data.except(:photo))
  file = URI.parse(pothole_data[:photo]).open
  pothole.photo.attach(io: file, filename: "#{pothole.id}.jpg", content_type: "image/jpg")
  puts "Created Pothole at #{pothole.address}"
end

puts "Finished creating potholes."
