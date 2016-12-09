require 'pp'

[0,1,2,3,4,5,6,7,8,9].each_slice(2) do |slice|
  pp slice
end

#
[0,1,2,3,4,5,6,7,8,9].each_slice(2)  # => #<Enumerator: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]:each_slice(2)>

[0,1,2,3,4,5,6,7,8,9].each_slice(2).map do |slice|
  pp slice.reduce(:+)
end

# >> [0, 1]
# >> [2, 3]
# >> [4, 5]
# >> [6, 7]
# >> [8, 9]
