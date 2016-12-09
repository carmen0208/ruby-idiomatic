require 'pp'
# __callee__ : always return the method name, in this way, it eliminate the
# duplication of the medhot name. and ensure that if we ever change the name of
# the method the call to `#to_enum` will continus to work
def names 
  return to_enum(__callee__) unless block_given?
  yield "Ylva"
  yield "Brighid"
  yield "Shifra"
  yield "Yesaman"
end

names # => #<Enumerator: main:names>
names.to_a # => ["Ylva", "Brighid", "Shifra", "Yesaman"]
