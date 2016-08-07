def explore_array(method)
  code = "['a', 'b', 'c'].#{method}"
  puts "Evaluating: #{code}"
  eval code
end

loop { p explore_array(gets()) }

# ruby metaprogramming/ctwc/array_explorer.rb
# find_index("b")
# Evaluating: ['a', 'b', 'c'].find_index("b")
# 1
# map!{|e| e.next}
# Evaluating: ['a', 'b', 'c'].map!{|e| e.next}
# ["b", "c", "d"]

# this has a security risk ( Code Injection)
# find_index("b"); Dir.glob("*")
# Evaluating: ['a', 'b', 'c'].find_index("b"); Dir.glob("*")
# ["ctwc", "metaprogramming", "movie3.rb", "movie4.rb", "movie_test.rb", "movies.csv", "movies.rb", "movies2.rb", "movies3.rb", "README.md", "thoughts"]
