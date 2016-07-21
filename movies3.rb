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

#2-c: get total_rotten_tomatoes
## 1st way to do it:

# total_rotten_tomatoes = 0.0
# with_rotten_tomatoes.each do |movie|
#   total_rotten_tomatoes += movie.rotten_tomatoes
# end

## 2nd way to do it:

# module Enumerable
#   def aggregate(initial_value)
#     aggregation_value = initial_value
#     each do |item|
#       aggregation_value = yield(aggregation_value, item)
#     end
#     aggregation_value
#   end
# end
# total_rotten_tomatoes = with_rotten_tomatoes.aggregate(0.0) do |total, movie|
#   total + movie.rotten_tomatoes
# end

## 3rd way to do it:

total_rotten_tomatoes = with_rotten_tomatoes.reduce(0.0) do |total, movie|
  total + movie.rotten_tomatoes
end

average_rotten_tomatoes = total_rotten_tomatoes / with_rotten_tomatoes.size

puts "Average Rotten Tomatoes Score: #{average_rotten_tomatoes}"

# Big Release During Holidays?
# {"January" => 1, "Febrary" => 3 ....}
# SELECT month, COUNT(*) FROM movies GROUP BY month ORDER BY COUNT(*) DESC
## 1st way
# count_by_month ={}
# movies.each do |movie|
#   month_name = movie.release_date.strftime("%B")
#   count_by_month[month_name]||= 0
#   count_by_month[month_name] += 1
# end
#
# p count_by_month

## 2nd way
movie_by_month = movies.group_by do |movie|
  movie.release_date.strftime("%B")
end

# p movie_by_month #{"Janary" => [movie1,movie2 ...],"Febrary"=>[movie4],...}

# count_by_month = movie_by_month.map do |month_and_list|
#   # month = month_and_list.first
#   # list = month_and_list.last
#   month, list = month_and_list
#   [month, list.size]
# end

## 3rd way
count_by_month = movie_by_month.map do |month, list|
  [month, list.size]
end

p count_by_month.map {|pair| pair.join(": ")}
# December : 12
# June: 2

# p movies.last

#3. Find out how many movies I have in each genre
#4. Show a list of all the titles directed by George Lucas
