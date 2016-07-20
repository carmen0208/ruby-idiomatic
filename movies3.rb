#1. Read the movie.csv file
require 'csv'
require_relative 'movie3'
rows= CSV.read('movies.csv', :headers => true, :header_converters => :symbol,
:skip_blanks => true)

# p Movie.new(rows.first)
#2. Parse the data into a set of movies
#class CSV::Table
#  include Enumerable
#end
# module Enumerable
#   def transform
#     collection2 = []
#     each do |item|
#       collection2 << yield(item)
#     end
#     collection2
#   end
# end

#movies = []
# movies = rows.transform do |row|
#   Movie.new(row)
# end

movies = rows.map {|row| Movie.new(row) }

p movies.last

#3. Find out how many movies I have in each genre
#4. Show a list of all the titles directed by George Lucas
