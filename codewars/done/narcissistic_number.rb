


def narcissistic?( value )
  (value.to_s.each_char.to_a.map  {|x| x.to_i ** (value.to_s.each_byte.size)}.inject(:+) == value)? true : false
end