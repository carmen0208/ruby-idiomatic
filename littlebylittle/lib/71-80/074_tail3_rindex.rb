s = "LINE 1\nLine 2\nLine 3\n"

# This is the first of \n, the ends of line1
s.index("\n") # => 6

# Rindex is to finding something backwards. this is the last \n after line3
last = s.rindex("\n") # => 20
# params(last-1) Tells where is the ending place to start read
s.rindex("\n", last-1) # => 13
