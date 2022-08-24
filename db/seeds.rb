# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

puts "Cleaning DB"
Van.destroy_all
User.destroy_all
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

puts 'Creating 15 fake vans...'
15.times do
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

  file1 = URI.open("https://source.unsplash.com/random/?trucks")
  van.photos.attach(io: file1, filename: "file1.jpg", content_type: "image.jpg")

  file2 = URI.open("https://source.unsplash.com/random/?trucks")
  van.photos.attach(io: file2, filename: "file2.jpg", content_type: "image.jpg")

  file2 = URI.open("https://source.unsplash.com/random/?trucks")
  van.photos.attach(io: file2, filename: "file3.jpg", content_type: "image.jpg")
  van.save!
end

puts 'Finished!'
