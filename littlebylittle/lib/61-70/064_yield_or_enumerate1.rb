require 'pp'

[0,1,2,3,4,5,6,7,8,9].each_slice(2) do |slice|
  pp slice
end

#
[0,1,2,3,4,5,6,7,8,9].each_slice(2)  # => #<Enumerator: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]:each_slice(2)>

[0,1,2,3,4,5,6,7,8,9].each_slice(2).map do |slice|
  pp slice.reduce(:+)
end

#
def names 
  return to_enum(:names) unless block_given?
  yield "Ylva"
  yield "Brighid"
  yield "Shifra"
  yield "Yesaman"
end

names # => 
names.to_a # => 
# ~> -:17:in `names': no block given (yield) (LocalJumpError)
# ~> 	from -:23:in `<main>'
# >> [0, 1]
# >> [2, 3]
# >> [4, 5]
# >> [6, 7]
# >> [8, 9]
# >> 1
# >> 5
# >> 9
# >> 13
# >> 17
