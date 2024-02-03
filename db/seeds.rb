# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'json'
require 'open-uri'

api_url = "https://tmdb.lewagon.com/movie/top_rated"
puts api_url

movies_serialized = URI.open(api_url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE).read
movies = JSON.parse(movies_serialized)
#puts movies


Bookmark.destroy_all
puts 'Destroy in progress'
Movie.destroy_all
puts 'Destroy finished'
puts "Loading datas"
movies['results'].each do |movie|
  puts movie
  Movie.create!(title: movie['original_title'], overview: movie['overview'], poster_url: "https://image.tmdb.org/t/p/original"+movie['backdrop_path'], rating: movie['vote_average'] )
end
puts "Data loaded"
