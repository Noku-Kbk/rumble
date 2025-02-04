puts "start"
User.destroy_all
Pothole.destroy_all
Room.destroy_all

User.create!([
  { id: 20, name: "John Doe", email: "johndoe@example.com", password: "password" },
  { id: 21, name: "Jane Smith", email: "janesmith@example.com", password: "password" },
  { id: 22, name: "Michael Brown", email: "michaelbrown@example.com", password: "password" }
])

Pothole.create!([
  { id: 40, address: "22 Jesmond Road, Musgrave, Berea, Durban, South Africa", size: "Large", description: "A massive pothole causing traffic issues.", status: "reported", user_id: 20, latitude: -29.839474, longitude: 30.994302 },
  { id: 50, address: "14 Queen Nandi Drive, Newlands, Durban, South Africa", size: "Medium", description: "Pothole right at a speed bump, making it difficult to navigate without damaging tires.", status: "In progress", user_id: 20, latitude: -29.794361, longitude: 31.012119 },
  { id: 41, address: "892 Umgeni Road, Morningside, Durban, South Africa", size: "Large", description: "A medium-sized pothole near the curb.", status: "in progress", user_id: 20, latitude: -29.823233, longitude: 31.027092 },
  { id: 42, address: "115 Musgrave road, Musgrave, Durban, South Africa", size: "Small", description: "A small but dangerous pothole in the middle of the road.", status: "Fixed", user_id: 20, latitude: -29.848641, longitude: 30.999034 },
  { id: 43, address: "67 Hillier Road, Umbilo, Berea, Durban, South Africa", size: "Small", description: "Deep pothole on a busy highway, hazardous for cars.", status: "Reported", user_id: 20, latitude: -29.883368, longitude: 30.98254 },
  { id: 51, address: "8 Lighthouse Road, Umhlanga Rocks, Durban, South Africa", size: "Large", description: "A growing sinkhole-like pothole near the beach road, causing concern among locals.", status: "In Progress", user_id: 20, latitude: -29.725519, longitude: 31.083967 },
  { id: 44, address: "12 Florida Road, Morningside, Durban, South Africa", size: "Small", description: "Several small potholes forming in a row, making this busy street difficult to navigate.", status: "In progress", user_id: 20, latitude: -29.838157, longitude: 31.018352 },
  { id: 45, address: "22 Intersite Avenue, Springfield, Durban, South Africa", size: "Large", description: "Shallow but wide pothole that fills with water after rain, making it hard to detect.", status: "In progress", user_id: 20, latitude: -29.812395, longitude: 30.998311 },
  { id: 46, address: "89 Jan Smuts Highway, Mayville, Durban, South Africa", size: "Medium", description: "A massive pothole on the left lane, forcing drivers to change lanes unexpectedly.", status: "Report", user_id: 20, latitude: -29.850731, longitude: 30.986294 },
  { id: 52, address: "11 New Germany Road, Pinetown, Durban, South Africa", size: "Small", description: "Series of small potholes forming into one large depression, making driving rough.", status: "Done", user_id: 20, latitude: -29.826544, longitude: 30.928252 },
  { id: 47, address: "35 Essenwood Road, Musgrave, Durban, South Africa", size: "Medium", description: "Several medium-sized potholes close to a pedestrian crossing, posing a risk to both vehicles and pedestrians.", status: "Done", user_id: 20, latitude: -29.847986, longitude: 30.997632 },
  { id: 48, address: "56 Northway, Durban North, Durban, South Africa", size: "Large", description: "Deep pothole at the entrance of a shopping center, leading to multiple vehicle damages.", status: "In progress", user_id: 20, latitude: -29.783969, longitude: 31.036516 },
  { id: 49, address: "103 Bellair Road, Cato Manor, Durban, South Africa", size: "Small", description: "Expanding pothole due to heavy truck traffic, worsening after recent rains.", status: "Reported", user_id: 20, latitude: -29.86716, longitude: 30.964908 },
  { id: 53, address: "5 Rossburgh Drive, Rossburgh, Durban, South Africa", size: "Large", description: "Deep pothole on a downhill slope, increasing the risk of vehicle suspension damage.", status: "Reported", user_id: 20, latitude: -29.898333, longitude: 30.9725 },
  { id: 54, address: "99 Montclair Road, Montclair, Durban, South Africa", size: "Large", description: "Pothole forming near a bus stop, causing delays and disruptions in public transport.", status: "In progress", user_id: 20, latitude: -29.92225, longitude: 30.969531 },
  { id: 55, address: "39 Garth Road, Mayville, Durban, South Africa", size: "Small", description: "Small pothole.", status: "In progress", user_id: 20, latitude: -29.842755, longitude: 30.981782 }
])



