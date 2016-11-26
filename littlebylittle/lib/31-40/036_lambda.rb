#1. Lambda
greeter_p = proc do |name| 
  puts "Hello from Proc: #{name}" 
end
greeter_l = lambda do |name| 
  puts "Hello from Lambda: #{name}" 
end

p greeter_p #<Proc:0x007f8c8a04c220@littlebylittle/lib/31-40/036_lambda.rb:1>
p greeter_l #<Proc:0x007f8c8a04c1f8@littlebylittle/lib/31-40/036_lambda.rb:4 (lambda)>

greeter_p.call("carmen") #Hello from Proc: carmen
greeter_l.call("carmen") #Hello from Lambda: carmen

# 2. the different bewteen:
# It is about the how to deal with more params
#The basic Proc just throws away extra arguments, whereas the lambda version reports an error.

greeter_p.call("carmen", "ninja")  #Hello from Proc: carmen
greeter_l.call("carmen", "ninja")  #`block in <main>': wrong number of arguments (2 for 1) (ArgumentError)

#3. an other way to write lambda

greeter_ls = ->(name) {
  puts "Hello from short lambda:#{name}"
}

greeter_ls.call("carmen")

