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
require 'httparty'

def fetch_random_image_url
  response = HTTParty.get('https://picsum.photos/seed/picsum/500/500')
  return response.request.last_uri.to_s
end


products_without_images = Product.where.not(id: Product.joins(:images_attachments))


products_without_images.each do |product|
  random_image_url = fetch_random_image_url
  product.images.attach(io: URI.open(random_image_url), filename: 'random_image.jpg')
end
products_without_images.each(&:save)
=end

