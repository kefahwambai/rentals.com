# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(username: "JohnDoe", email: "johndoe@example.com", password: "password")
User.create(username: "JaneDoe", email: "janedoe@example.com", password: "password")

# car rentals
CarRental.create(
  image_url: "https://example.com/image.jpg",
  carmake: "Toyota",
  carmodel: "Corolla",
  price: 100,
  description: "A comfortable and reliable car for everyday use.",
  fuel: "Gasoline"
)
CarRental.create(
  image_url: "https://example.com/image.jpg",
  carmake: "Honda",
  carmodel: "Civic",
  price: 80,
  description: "A sporty and fun car for city driving.",
  fuel: "Gasoline"
)

# reviews
Review.create(
  username: "JohnDoe",
  comment: "Great car! Very comfortable and easy to drive.",
  rating: 4,
  car_rental_id: 1
)

Review.create(
  username: "JaneDoe",
  comment: "Not a fan of this car. It was too small for my needs.",
  rating: 2,
  car_rental_id: 2
)