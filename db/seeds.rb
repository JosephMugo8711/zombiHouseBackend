# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

40.times do
  Buyer.create!(
    username: Faker::Internet.username,
    fullname: Faker::Name.name,
    email: Faker::Internet.email,
    contact: Faker::PhoneNumber.phone_number,
    budget: rand(1000..10000),
    role: "buyer",
    subscription_package: Faker::Lorem.word,
    password_digest: BCrypt::Password.create("password"),
    avatar: Faker::Avatar.image,
  )
end
