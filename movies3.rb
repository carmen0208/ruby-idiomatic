#1. Read the movie.csv file
require 'csv'
require_relative 'movie3'
rows= CSV.read('movies.csv', :headers => true, :header_converters => :symbol,
:skip_blanks => true)

# p Movie.new(rows.first)
#2. Parse the data into a set of movies

movies = []
rows.each do |row|
  movies << Movie.new(row)
end

p movies.last

#3. Find out how many movies I have in each genre
#4. Show a list of all the titles directed by George Lucas
