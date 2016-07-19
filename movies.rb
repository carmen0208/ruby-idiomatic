#1. Read the movie.csv file

# read_all_line = lambda {|file_handle| file_handle.readlines }
# lines = File.open("movies.csv", "r",&read_all_line)

lines = File.open("movies.csv", "r") do |file_handle|
  file_handle.readlines
end

# "title.director..." => ["title", "director"...]
rows = []
lines.each do |line|
  rows << line.chomp.split(",")
end

p rows.first
#=> ["title", "release date", "director", "genre"]




#2. Parse the data into a set of movies
#3. Find out how many movies I have in each genre
#4. Show a list of all the titles directed by George Lucas
