require 'faker'
require "open-uri"

puts "Cleaning DB"
Van.destroy_all
User.destroy_all
Review.destroy_all
Booking.destroy_all
puts "DB cleaned"

puts 'Creating 15 fake users...'
15.times do
  user = User.new({
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      address: Faker::Address.street_name,
      bio: Faker::Lorem.paragraphs(number: 3).join,
      age: rand(21..80),
      driving_license: Faker::IDNumber.spanish_citizen_number,
      phone_number: Faker::PhoneNumber.phone_number,
      email: Faker::Internet.email,
      password: Faker::Code.nric
    })
  user.save!
end
puts 'Finished!'

puts 'Creating fake vans...'


van1 = Van.new({
  title: "Cozy van for 2 people",
  color: "Green",
  capacity: 2,
  description: "Great van for roadtrips. Fully equiped. Departure city is Paris.",
  location: "11 villa Gaudelet",
  brand: "Volkswagen",
  price_per_day: rand(50..500),
  mileage: Faker::Vehicle.mileage,
  user_id: User.all.sample.id
  })

  file1 = URI.open("https://images.unsplash.com/photo-1625492995811-646c41068abe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80")
  van1.photos.attach(io: file1, filename: "file1.jpg", content_type: "image.jpg")

  file2 = URI.open("https://images.unsplash.com/photo-1557854588-d0a7bb40a50d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2181&q=80")
  van1.photos.attach(io: file2, filename: "file2.jpg", content_type: "image.jpg")

  file3 = URI.open("https://images.unsplash.com/photo-1619677394722-6397960e590b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2864&q=80")
  van1.photos.attach(io: file3, filename: "file3.jpg", content_type: "image.jpg")
  van1.save!

van2 = Van.new ({
  title: "Yellow Blaster",
  color: "Yellow",
  capacity: 3,
  description: "You'll be able to live a perfect vintage experience aboard my Yellow Blaster! This Volksvagen T3 is perfectly equiped for surfing and all your favorite outdoors activities",
  location: "8 rue Dauphine 75006, Paris",
  brand: "Volkswagen",
  price_per_day: rand(50..500),
  mileage: Faker::Vehicle.mileage,
  user_id: User.all.sample.id
  })

  file4 = URI.open("https://images.unsplash.com/photo-1527786356703-4b100091cd2c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2874&q=80")
  van2.photos.attach(io: file4, filename: "file4.jpg", content_type: "image.jpg")

  file5 = URI.open("https://images.unsplash.com/photo-1515876305430-f06edab8282a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80")
  van2.photos.attach(io: file5, filename: "file5.jpg", content_type: "image.jpg")

  file6 = URI.open("https://images.unsplash.com/photo-1533116503071-39e69ebf687a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80")
  van2.photos.attach(io: file6, filename: "file6.jpg", content_type: "image.jpg")
  van2.save!


  van3 = Van.new ({
    title: "Brand New Modern Van",
    color: "Green",
    capacity: 2,
    description: Faker::Lorem.paragraphs(number: 3).join,
    location: "Lille",
    brand: "Ford",
    price_per_day: rand(50..500),
    mileage: Faker::Vehicle.mileage,
    user_id: User.all.sample.id
  })

    file7 = URI.open("https://images.unsplash.com/photo-1627386173398-5e8f2dff25f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1064&q=80")
    van3.photos.attach(io: file7, filename: "file7.jpg", content_type: "image.jpg")

    file8 = URI.open("https://images.unsplash.com/photo-1627386172141-c6fec8bf5aa3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80")
    van3.photos.attach(io: file8, filename: "file8.jpg", content_type: "image.jpg")

    file9 = URI.open("https://images.unsplash.com/photo-1627386172764-1d1b7ea90b66?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2880&q=80")
    van3.photos.attach(io: file9, filename: "file9.jpg", content_type: "image.jpg")
    van3.save!



  van4 = Van.new ({
    title: "Cozy and resistant vintage van",
    color: "Orange",
    capacity: 2,
    description: Faker::Lorem.paragraphs(number: 3).join,
    location: "Saint-Malo",
    brand: "Ford",
    price_per_day: rand(50..500),
    mileage: Faker::Vehicle.mileage,
    user_id: User.all.sample.id
  })

    file10 = URI.open("https://images.unsplash.com/photo-1603109108961-621f59ad567e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80")
    van4.photos.attach(io: file10, filename: "file10.jpg", content_type: "image.jpg")

    file11 = URI.open("https://images.unsplash.com/photo-1520116468816-95b69f847357?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80")
    van4.photos.attach(io: file11, filename: "file11.jpg", content_type: "image.jpg")
    van4.save!


  van5 = Van.new ({
    title: "Fully equiped vintage van",
    color: "Blue",
    capacity: 2,
    description: Faker::Lorem.paragraphs(number: 3).join,
    location: "Melton Court, London",
    brand: "Volkswagen",
    price_per_day: rand(50..500),
    mileage: Faker::Vehicle.mileage,
    user_id: User.all.sample.id
  })

    file12 = URI.open("https://images.unsplash.com/photo-1579279218983-e46279c85859?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80")
    van5.photos.attach(io: file12, filename: "file12.jpg", content_type: "image.jpg")

    file13 = URI.open("https://images.unsplash.com/flagged/photo-1557774673-a24ffb210ad8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2181&q=80")
    van5.photos.attach(io: file13, filename: "file13.jpg", content_type: "image.jpg")

    file14 = URI.open("https://images.unsplash.com/photo-1570511029996-7820fc2ee5f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2831&q=80")
    van5.photos.attach(io: file14, filename: "file14.jpg", content_type: "image.jpg")
    van5.save!

  van6 = Van.new ({
    title: "Modern van with outdoor equipement",
    color: "White",
    capacity: 4,
    description: "Great van. The bedroom is on the roof and will allow you the best sunsets you ever seen. It comes fully equiped!",
    location: "5 Avenue du Lac Marion",
    brand: "Mitsubishi",
    price_per_day: rand(50..500),
    mileage: Faker::Vehicle.mileage,
    user_id: User.all.sample.id
  })

    file15 = URI.open("https://images.unsplash.com/photo-1610851252127-85442ca5528e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2071&q=80")
    van6.photos.attach(io: file15, filename: "file15.jpg", content_type: "image.jpg")

    file16 = URI.open("https://images.unsplash.com/photo-1610511402844-c6b49f644a60?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80")
    van6.photos.attach(io: file16, filename: "file16.jpg", content_type: "image.jpg")
    van6.save!


5.times do
  van = Van.new({
    title: Faker::Hipster.sentence(word_count: 3),
    color: Faker::Vehicle.color,
    capacity: rand(2..8),
    description: Faker::Lorem.paragraphs(number: 3).join,
    location: Faker::Address.street_name,
    brand: Faker::Vehicle.make,
    price_per_day: rand(50..500),
    mileage: Faker::Vehicle.mileage,
    user_id: User.all.sample.id
  })

  file17 = URI.open("https://source.unsplash.com/random/900x700/?vanlife")
  van.photos.attach(io: file17, filename: "file17.jpg", content_type: "image.jpg")

  file18 = URI.open("https://source.unsplash.com/random/900x700/?vanlife")
  van.photos.attach(io: file18, filename: "file18.jpg", content_type: "image.jpg")

  file19 = URI.open("https://source.unsplash.com/random/900x700/?vanlife")
  van.photos.attach(io: file19, filename: "file19.jpg", content_type: "image.jpg")
  van.save!
end

puts 'Finished!'


booking1 = Booking.create!({
  van_id: van2.id,
  user_id: User.all.sample.id,
  start_date: Time.new(2021, 02, 9),
  end_date: Time.new(2021, 02, 20),
})

booking2 = Booking.create!({
  van_id: van2.id,
  user_id: User.all.sample.id,
  start_date: Time.new(2022, 06, 07),
  end_date: Time.new(2021, 06, 20),
})

booking3 = Booking.create!({
  van_id: van6.id,
  user_id: User.all.sample.id,
  start_date: Time.new(2022, 06, 07),
  end_date: Time.new(2021, 06, 20),
})

review1 = Review.create!({
  booking_id: booking1.id,
  rating: 4,
  content: "Great van, love it! I recommend"
})

review2 = Review.create!({
  booking_id: booking2.id,
  rating: 5,
  content: "Amazing experience!"
})

review3 = Review.create!({
  booking_id: booking3.id,
  rating: 5,
  content: "Amazing experience!"
})
