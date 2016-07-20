#1. Read the movie.csv file
require 'csv'
movies= CSV.read('movies.csv', :headers => true, :header_converters => :symbol,
:skip_blanks => true)

p movies.first
#movie that we should have a null
p movies[5]
#movie which has a "" in it, makes it hard to parse
p movies[9]

#2. Parse the data into a set of movies
#3. Find out how many movies I have in each genre
#4. Show a list of all the titles directed by George Lucas
