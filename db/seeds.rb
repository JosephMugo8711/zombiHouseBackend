# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# 40.times do
#   Buyer.create!(
#     username: Faker::Internet.username,
#     fullname: Faker::Name.name,
#     email: Faker::Internet.email,
#     contact: Faker::PhoneNumber.phone_number,
#     budget: rand(1000..10000),
#     role: "buyer",
#     subscription_package: Faker::Lorem.word,
#     password_digest: BCrypt::Password.create("password"),
#     avatar: Faker::Avatar.image,
#   )
# end


# 40.times do
#   Seller.create!(
#     company_name: Faker::Company.name,
#     location: Faker::Address.full_address,
#     contact: Faker::PhoneNumber.phone_number,
#     email: Faker::Internet.email,
#     password_digest: BCrypt::Password.create("password"),
#     subscription_package: Faker::Lorem.word,
#     role: "seller",
#     avatar: Faker::Avatar.image,
#   )
# end


# 5.times do
#   Admin.create!(
#     username: Faker::Internet.username,
#     fullname: Faker::Name.name,
#     email: Faker::Internet.email,
#     contact: Faker::PhoneNumber.phone_number,
#     role: "admin",
#     avatar: Faker::Avatar.image,
#     password_digest: BCrypt::Password.create("password")
#   )
# end



# 50.times do
#   Property.create!(
#     location: Faker::Address.full_address,
#     price: Faker::Commerce.price(range: 10000..500000),
#     seller_id: Seller.pluck(:id).sample,
#     buyer_id: Buyer.pluck(:id).sample,
#     status: ["available", "sold", "selling"].sample,
#     property_type: Faker::Lorem.word,
#     image: Faker::LoremFlickr.image(size: "300x200", search_terms: ['property']),
#     description: Faker::Lorem.paragraph,
#     size_in_sqft: rand(500..5000)
#   )
# end

Buyer.create([
  {
    "username": "jowamu",
     "fullname": "joseph Wamiti",
     "email": "jose@gmail.com",
     "contact": "000000",
      "avatar": "https://robohash.org/repellatquibusdamet.png?size=300x300&set=set1",
       "budget": "1000000",
    "subscription_package": "minus",
     "password": "12345678"

  }
])




