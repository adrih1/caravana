# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

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
    color:  Faker::Vehicle.color,
    description: Faker::Lorem.paragraphs(number: 3).join,
    location:Faker::Address.street_name,
    brand: Faker::Vehicle.make,
    price_per_day: rand(50..500),
    mileage: Faker::Vehicle.mileage,
    user_id: User.all.sample.id
  })
  van.save!
end
puts 'Finished!'
