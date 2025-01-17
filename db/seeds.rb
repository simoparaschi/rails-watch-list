# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 10.times do
#   rating = rand(0..10)
#   movie = Movie.new(
#     title: Faker::Movie.title,
#     overview: Faker::Movies::VForVendetta.quote,
#     poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg",
#     rating: rating
#   )
#   movie.save!
# end

require "json"
require "open-uri"
url = "https://tmdb.lewagon.com/movie/top_rated"
user_serialized = URI.parse(url).read
user = JSON.parse(user_serialized)


user["results"].each do |item|
  movie = Movie.new(
    title: item["original_title"],
    overview: item["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500/#{item["poster_path"]}",
    rating: item["vote_average"]
  )
  movie.save!
end
