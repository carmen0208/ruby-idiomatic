default = []
h = Hash.new(default)

h["carmen"] << "carmen1"
h["carmen"] << "carmen2"
h["carmen"] << "carmen3"
h["lizzy"] << "lizzy1"
p h["lizzy"]  #=>["carmen1", "carmen2", "carmen3", "lizzy1"]
p h ["carmen"] #=> ["carmen1", "carmen2", "carmen3", "lizzy1"]
p h["non_exist"] #=> ["carmen1", "carmen2", "carmen3", "lizzy1"]
p h #=> {}
p default  #=> ["carmen1", "carmen2", "carmen3", "lizzy1"]

# frome the case below, you 'll find that the actually chances, is the array
# instead

# FIX it in:
p "fixed version, this is a syntactic sugar for hsh[:two] = hsh[:two] + ['two']"
default2 = []
h = Hash.new(default2)
h["carmen"] += ["carmen1"] 
h["carmen"] += ["carmen2"] 
h["carmen"] += ["carmen3"] 
h["lizzy"] += ["lizzy1"]  
h["lizzy"] += ["lizzy2"]
p h["carmen"] #=>["carmen1", "carmen2", "carmen3"]
p h["lizzy"] #=> ["lizzy1", "lizzy2"]
p h["non-exist"]#=> []
p h #=> {"carmen"=>["carmen1", "carmen2", "carmen3"], "lizzy"=>["lizzy1", "lizzy2"]}
p default2 #=> []

# Better version: using Block to define, in order to 
# The block not only *returns* the default value, it also *assigns* it

p "Block verion, the block not only returns the dafault value, is also assigns it"

h = Hash.new do |hash, default_value|
  hash[default_value] = []
end
h["carmen"] << ["carmen1"] 
h["carmen"] << ["carmen2"] 
h["carmen"] << ["carmen3"] 
h["lizzy"] << ["lizzy1"]  
h["lizzy"] << ["lizzy2"]
p h["carmen"] #=>["carmen1", "carmen2", "carmen3"]
p h["lizzy"] #=> ["lizzy1", "lizzy2"]
p h["non-exist"]#=> []
p h #=> {"carmen"=>["carmen1", "carmen2", "carmen3"], "lizzy"=>["lizzy1", "lizzy2"]}


