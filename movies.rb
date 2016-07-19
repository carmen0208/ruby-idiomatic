# Read the movie.csv file

# read_all_line = lambda {|file_handle| file_handle.readlines }
#
# lines = File.open("movies.csv", "r",&read_all_line)

lines = File.open("movies.csv", "r") do |file_handle|
  file_handle.readlines
end

p lines
# Parse the data into a set of movies
# Find out how many movies I have in each genre
# Show a list of all the titles directed by George Lucas
