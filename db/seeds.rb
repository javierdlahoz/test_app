# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..200).each do |n|
  attrs = { full_url: Faker::Internet.url, counter: rand(1...1000), domain: Rails.application.config.ui_domain }
  Url.fetch_or_create(attrs).save
end