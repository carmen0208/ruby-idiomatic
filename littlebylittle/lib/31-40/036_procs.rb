# 1 way:
greeter = Proc.new do |name|
  puts "Hello, #{name}"
end

p greeter
##<Proc:0x007fcf04898cc8@littlebylittle/lib/31-40/036_procs.rb:1>
greeter.call("Carmen")
#Hello, Carmen

# 2 ways(Kernel#proc)

greeter = proc do |name|
  puts "Hello from `kernel#proc`: #{name}"
end

p greeter
##<Proc:0x007fcf04898cc8@littlebylittle/lib/31-40/036_procs.rb:1>
greeter.call("Carmen")
#Hello, Carmen
greeter.call("Ninja")
#Hello, Carmen
greeter.("other way to call")
greeter["3rd way to call"]


