require 'ostruct'

s = Struct.new(:foo, :bar).new(42,23)
os = OpenStruct.new(foo: 42,bar: 23)
p s.members
p os.members
p s.map {|value| value*2}
p os.map {|value| value*2}



 #=>[:foo, :bar]
 #=>nil
 #=>[84, 46]
 #=>nil
