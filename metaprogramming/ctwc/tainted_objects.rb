# user_input = "User input: #{gets()}"
# puts user_input.tainted?

$SAFE = 1
user_input = "User input: #{gets()}"
eval user_input

# metaprogramming/ctwc/tainted_objects.rb:6:in `eval': Insecure operation: -r (SecurityError)
# 	from metaprogramming/ctwc/tainted_objects.rb:6:in `<main>'
