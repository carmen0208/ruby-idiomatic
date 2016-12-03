#level 6
require_relative '../../metaprogramming/test/assertions'

def likes(names)
  case names.size
    when 0
      "no one likes this"
    when 1
      "#{names[0]} likes this"
    when 2
      "#{names[0]} and #{names[1]} like this"
    when 3
      "#{names[0]}, #{names[1]} and #{names[2]} like this"
    else
      "#{names[0]}, #{names[1]} and #{names.size - 2} others like this"
  end


end


assert_equals(likes([]), 'no one likes this')
assert_equals(likes(['Peter']), 'Peter likes this')
assert_equals(likes(['Jacob', 'Alex']), 'Jacob and Alex like this')
assert_equals(likes(['Max', 'John', 'Mark']), 'Max, John and Mark like this')
assert_equals(likes(['Alex', 'Jacob', 'Mark', 'Max']), 'Alex, Jacob and 2 others like this')

## Comments: this is not challenge at all, but at least , you find out, sometimes. t
# the internal iteration is not works and you have to using something like case
# to finish all the query
