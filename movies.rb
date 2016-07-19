# Read the movie.csv file
file_handle = File.open("movies.csv", "r")
begin
lines = file_handle.readlines
ensure
file_handle.close
end

p lines
# Parse the data into a set of movies
# Find out how many movies I have in each genre
# Show a list of all the titles directed by George Lucas
