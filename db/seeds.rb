require 'open-uri'
require 'json'


url = 'http://tmdb.lewagon.com/movie/top_rated'
img_url = 'https://image.tmdb.org/t/p/w500/'
serialized_movies = URI.open(url).read
unserialized_movies = JSON.parse(serialized_movies)

unserialized_movies['results'].each do |movie_hash|
  title = movie_hash['title']
  overview = movie_hash['overview']
  poster_url = "#{img_url}#{movie_hash['poster_path']}"
  rating = movie_hash['vote_average']
  Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
end
