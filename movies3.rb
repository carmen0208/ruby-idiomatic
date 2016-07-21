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

#2-b: get the rotten_tomatoe score
## 1st way to do it :
# with_rotten_tomatoes = []
# movies.each do |movie|
#   with_rotten_tomatoes << movie if movie.rotten_tomatoes > 0
# end
#

## 2nd way to do it :
# module Enumerable
#   def subset
#     collection =[]
#     each do |item|
#       collection << item if yield(item)
#     end
#     collection
#   end
# end
#
# with_rotten_tomatoes = movies.subset {|movie|  movie.rotten_tomatoes >0 }


##3rd way to do it :
with_rotten_tomatoes = movies.select{|movie| movie.rotten_tomatoes >0}
total_rotten_tomatoes = 0.0
with_rotten_tomatoes.each do |movie|
  total_rotten_tomatoes += movie.rotten_tomatoes
end

average_rotten_tomatoes = total_rotten_tomatoes / with_rotten_tomatoes.size

puts "Average Rotten Tomatoes Score: #{average_rotten_tomatoes}"

# p movies.last

#3. Find out how many movies I have in each genre
#4. Show a list of all the titles directed by George Lucas
