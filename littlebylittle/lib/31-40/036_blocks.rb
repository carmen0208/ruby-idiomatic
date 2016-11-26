def each_child
  ["lily", "Josh", "Carmen", "Ninja", "Ebba"].each do |name|
    yield name
  end
end

each_child do |name|
  puts "Hello, #{name}"
end

def each_child(&visitor)
 puts visitor.inspect
 visitor.call("lily")
 visitor.call("Josh")
 visitor.call("Kashti")
 visitor.call("Ebba")
end

each_child do |name|
  puts "Hello, #{name}!"
end
