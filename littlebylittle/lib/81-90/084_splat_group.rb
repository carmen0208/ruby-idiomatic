expr = [:*, 3, [:+, 2, 5]]

# the rebose way(intermediate veriable)
op, f1, f2 = expr
op # => :*
f1 # => 3
f2 # => [:+, 2, 5]
inner_op, t1, t2 = f2
inner_op # => :+
t1 # => 2
t2 # => 5

## Extract directly
op, f1, (inner_op, t1,t2) = expr
op # => :*
f1 # => 3
inner_op # => :+
t1 # => 2
t2 # => 5

## Bouns
expr = [:*, 3, [:+, 2, 5, 7]]
op, f1, (inner_op, *ts) = expr
op # => :*
f1 # => 3
inner_op # => :+
ts # => [2, 5, 7]


