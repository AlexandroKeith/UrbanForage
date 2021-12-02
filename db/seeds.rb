require 'google_search_results'

puts "Pulling out restaurant seeds"
RestaurantVibe.destroy_all
Photo.destroy_all
Vibe.destroy_all
Restaurant.destroy_all

# SETTING UP SCENIC VIBE

puts "Planting panoramic scenic restaurant seeds"

scenic_vibe = Vibe.create(name: 'scenic')

scenic_params = {
  engine: "google_maps",
  q: "restaurants+with+view",
  ll: "@38.7223,-9.1393,15.1z",
  type: "search",
  api_key: "4d9950649d8ed5a64d671aacd6950b0ba30688cff9980b1eeffd566489295219"
}

scenic_search = GoogleSearch.new(scenic_params)
scenic_results = scenic_search.get_hash[:local_results]

scenic_results.each do |result|
  scenic_photo_params = {
    engine: "google_maps_photos",
    q: "",
    data_id: result[:data_id],
    api_key: "4d9950649d8ed5a64d671aacd6950b0ba30688cff9980b1eeffd566489295219"
  }
  scenic_photo_search = GoogleSearch.new(scenic_photo_params)
  scenic_photos = scenic_photo_search.get_hash[:photos]

  scenic_restaurant = Restaurant.create(
  name: result[:title],
  cuisine: result[:type],
  address: result[:address],
  website: result[:website],
  phone_number: result[:phone],
  menu: rand(1..10),
  price_range: result[:price],
  latitude: result[:gps_coordinates][:latitude],
  longitude: result[:gps_coordinates][:longitude],
  image: scenic_photos[0][:image],
  description: result[:description]
  )

  scenic_photos_array = []
  scenic_photos.first(8).each { |image| scenic_photos_array << image[:image] }

  scenic_photos_array.each do |url|
    Photo.create(
      url: url,
      restaurant_id: scenic_restaurant[:id]
    )
  end

  RestaurantVibe.create(
    vibe_id: scenic_vibe[:id],
    restaurant_id: scenic_restaurant[:id]
  )
end



# GENERATING UP MELODIC VIBES

puts "Tuning up some melodic restaurant seeds"

melodic_vibe = Vibe.create(name: 'melodic')

melodic_params = {
  engine: "google_maps",
  q: "restaurants+with+live+music",
  ll: "@38.7223,-9.1393,15.1z",
  type: "search",
  api_key: "4d9950649d8ed5a64d671aacd6950b0ba30688cff9980b1eeffd566489295219"
}

melodic_search = GoogleSearch.new(melodic_params)
melodic_results = melodic_search.get_hash[:local_results]

melodic_results.each do |result|
  melodic_photo_params = {
    engine: "google_maps_photos",
    q: "",
    data_id: result[:data_id],
    api_key: "4d9950649d8ed5a64d671aacd6950b0ba30688cff9980b1eeffd566489295219"
  }
  melodic_photo_search = GoogleSearch.new(melodic_photo_params)
  melodic_photos = melodic_photo_search.get_hash[:photos]

  melodic_restaurant = Restaurant.create!(
  name: result[:title],
  cuisine: result[:type],
  address: result[:address],
  website: result[:website],
  phone_number: result[:phone],
  menu: rand(1..10),
  price_range: result[:price],
  latitude: result[:gps_coordinates][:latitude],
  longitude: result[:gps_coordinates][:longitude],
  image: melodic_photos[0][:image],
  description: result[:description]
)

  melodic_photos_array = []
  melodic_photos.first(8).each { |image| melodic_photos_array << image[:image] }

  melodic_photos_array.each do |url|
    Photo.create(
      url: url,
      restaurant_id: melodic_restaurant[:id]
    )
  end

  RestaurantVibe.create(
    vibe_id: melodic_vibe[:id],
    restaurant_id: melodic_restaurant[:id]
  )
end

# GENERATING COZY VIBES

puts "Snuggling up some cozy restaurant seeds"

cozy_vibe = Vibe.create(name: 'cozy')

cozy_params = {
  engine: "google_maps",
  q: "restaurant+simple+snug",
  ll: "@38.7223,-9.1393,15.1z",
  type: "search",
  api_key: "4d9950649d8ed5a64d671aacd6950b0ba30688cff9980b1eeffd566489295219"
}

cozy_search = GoogleSearch.new(cozy_params)
cozy_results = cozy_search.get_hash[:local_results]

cozy_results.each do |result|
  cozy_photo_params = {
    engine: "google_maps_photos",
    q: "",
    data_id: result[:data_id],
    api_key: "4d9950649d8ed5a64d671aacd6950b0ba30688cff9980b1eeffd566489295219"
  }
  cozy_photo_search = GoogleSearch.new(cozy_photo_params)
  cozy_photos = cozy_photo_search.get_hash[:photos]

  cozy_restaurant = Restaurant.create!(
  name: result[:title],
  cuisine: result[:type],
  address: result[:address],
  website: result[:website],
  phone_number: result[:phone],
  menu: rand(1..10),
  price_range: result[:price],
  latitude: result[:gps_coordinates][:latitude],
  longitude: result[:gps_coordinates][:longitude],
  image: cozy_photos[0][:image],
  description: result[:description]
)

  cozy_photos_array = []
  cozy_photos.first(8).each { |image| cozy_photos_array << image[:image] }

  cozy_photos_array.each do |url|
    Photo.create(
      url: url,
      restaurant_id: cozy_restaurant[:id]
    )
  end

  RestaurantVibe.create(
    vibe_id: cozy_vibe[:id],
    restaurant_id: melodic_restaurant[:id]
  )
end



# GENERATING EARTHY VIBES

puts "Planting some earthy, organic restaurant seeds"

earthy_vibe = Vibe.create(name: 'earthy')

earthy_params = {
  engine: "google_maps",
  q: "restaurant+plants+interior",
  ll: "@38.7223,-9.1393,15.1z",
  type: "search",
  api_key: "4d9950649d8ed5a64d671aacd6950b0ba30688cff9980b1eeffd566489295219"
}

earthy_search = GoogleSearch.new(earthy_params)
earthy_results = earthy_search.get_hash[:local_results]

earthy_results.each do |result|
  earthy_photo_params = {
    engine: "google_maps_photos",
    q: "",
    data_id: result[:data_id],
    api_key: "4d9950649d8ed5a64d671aacd6950b0ba30688cff9980b1eeffd566489295219"
  }
  earthy_photo_search = GoogleSearch.new(earthy_photo_params)
  earthy_photos = earthy_photo_search.get_hash[:photos]

  earthy_restaurant = Restaurant.create!(
  name: result[:title],
  cuisine: result[:type],
  address: result[:address],
  website: result[:website],
  phone_number: result[:phone],
  menu: rand(1..10),
  price_range: result[:price],
  latitude: result[:gps_coordinates][:latitude],
  longitude: result[:gps_coordinates][:longitude],
  image: earthy_photos[0][:image],
  description: result[:description]
)

  earthy_photos_array = []
  earthy_photos.first(8).each { |image| earthy_photos_array << image[:image] }

  earthy_photos_array.each do |url|
    Photo.create(
      url: url,
      restaurant_id: earthy_restaurant[:id]
    )
  end

  RestaurantVibe.create(
    vibe_id: earthy_vibe[:id],
    restaurant_id: earthy_restaurant[:id]
  )
end


# GENERATING MINIMALIST VIBES

puts "Asking interior designer for some minimalist restaurant seeds"

minimalist_vibe = Vibe.create(name: 'minimalist')

minimalist_params = {
  engine: "google_maps",
  q: "restaurant+modern+design+decor",
  ll: "@38.7223,-9.1393,15.1z",
  type: "search",
  api_key: "4d9950649d8ed5a64d671aacd6950b0ba30688cff9980b1eeffd566489295219"
}

minimalist_search = GoogleSearch.new(minimalist_params)
minimalist_results = minimalist_search.get_hash[:local_results]

minimalist_results.each do |result|
  minimalist_photo_params = {
    engine: "google_maps_photos",
    q: "",
    data_id: result[:data_id],
    api_key: "4d9950649d8ed5a64d671aacd6950b0ba30688cff9980b1eeffd566489295219"
  }
  minimalist_photo_search = GoogleSearch.new(minimalist_photo_params)
  minimalist_photos = minimalist_photo_search.get_hash[:photos]

  minimalist_restaurant = Restaurant.create!(
  name: result[:title],
  cuisine: result[:type],
  address: result[:address],
  website: result[:website],
  phone_number: result[:phone],
  menu: rand(1..10),
  price_range: result[:price],
  latitude: result[:gps_coordinates][:latitude],
  longitude: result[:gps_coordinates][:longitude],
  image: minimalist_photos[0][:image],
  description: result[:description]
)

  minimalist_photos_array = []
  minimalist_photos.first(8).each { |image| minimalist_photos_array << image[:image] }

  minimalist_photos_array.each do |url|
    Photo.create(
      url: url,
      restaurant_id: minimalist_restaurant[:id]
    )
  end

  RestaurantVibe.create(
    vibe_id: minimalist_vibe[:id],
    restaurant_id: minimalist_restaurant[:id]
  )
end

# GENERATING ALTERNATIVE VIBES

puts "Thrifting some alternative restaurant seeds"

alternative_vibe = Vibe.create(name: 'alternative')

alternative_params = {
  engine: "google_maps",
  q: "restaurant+interesting+concept+hipster",
  ll: "@38.7223,-9.1393,15.1z",
  type: "search",
  api_key: "4d9950649d8ed5a64d671aacd6950b0ba30688cff9980b1eeffd566489295219"
}

alternative_search = GoogleSearch.new(alternative_params)
alternative_results = alternative_search.get_hash[:local_results]

alternative_results.each do |result|
  alternative_photo_params = {
    engine: "google_maps_photos",
    q: "",
    data_id: result[:data_id],
    api_key: "4d9950649d8ed5a64d671aacd6950b0ba30688cff9980b1eeffd566489295219"
  }
  alternative_photo_search = GoogleSearch.new(alternative_photo_params)
  alternative_photos = alternative_photo_search.get_hash[:photos]

  alternative_restaurant = Restaurant.create!(
  name: result[:title],
  cuisine: result[:type],
  address: result[:address],
  website: result[:website],
  phone_number: result[:phone],
  menu: rand(1..10),
  price_range: result[:price],
  latitude: result[:gps_coordinates][:latitude],
  longitude: result[:gps_coordinates][:longitude],
  image: alternative_photos[0][:image],
  description: result[:description]
)

  alternative_photos_array = []
  alternative_photos.first(8).each { |image| alternative_photos_array << image[:image] }

  alternative_photos_array.each do |url|
    Photo.create(
      url: url,
      restaurant_id: alternative_restaurant[:id]
    )
  end

  RestaurantVibe.create(
    vibe_id: alternative_vibe[:id],
    restaurant_id: alternative_restaurant[:id]
  )
end

puts "#{Restaurant.count} total restaurant seeds planted, with #{Photo.count} photos attached"




# # OLD SEED

# # 16.times do
  # Restaurant.create(
  # name: Faker::Restaurant.name,
  # cuisine: Faker::Restaurant.type,
  # address: Faker::Address.street_address,
  # website: Faker::Internet.url,
  # phone_number: Faker::PhoneNumber.cell_phone,
  # menu: rand(1..10),
  # price_range: "$" * rand(1..4),
  # latitude: Faker::Address.latitude,
  # longitude: Faker::Address.longitude,
  # image: 'https://source.unsplash.com/random',
  # description: "Faker::Restaurant.description"
# )
# end
