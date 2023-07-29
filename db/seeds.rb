# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

=begin
100.times do
  Product.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price(range: 10..100),
    quantity: Faker::Number.between(from: 1, to: 100),
    user_id: 1
  )
end


# Create four categories for the four seasons
%w[Spring Summer Autumn Winter].each do |season|
  Category.create(name: season)
end

categories = Category.all
products = Product.all

# Assign each product to a random category
products.each do |product|
  random_category = categories.sample
  product.categories << random_category
end
=end

