# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

continents = %w[America Asia Africa Europe Oceania Antarctica]

continents.each do |continent|
  Continent.create(denomination: continent)
end

number_continents = continents.count

16.times do
  Country.create(
    denomination: Faker::Address.country,
    totat_surface_area: rand(100000..100000),
    continent_id: rand(number_continents) + 1
  )
end

20.times do
  City.create(
    denomination: Faker::Address.city,
    number_of_inhabitants: rand(1000..10000),
    totat_surface_area: rand(1000..10000),
    country_id: rand(Country.count) + 1
  )
end

# update the number of inhabitants for each country
Country.all.each do |country|
  country.update_number_of_inhabitants!
end

50.times do
  year = rand(1000..1990)
  month = rand(1..12)
  day = month == 2 ? rand(1..28) : rand(1..30)
  GeographicIcon.create(
    denomination: Faker::Mountain.name,
    date_of_creation: "#{year}-#{month}-#{day}",
    height: rand(10..100),
    history: Faker::Lorem.sentence,
    city_id: rand(City.count) + 1
  )
end
