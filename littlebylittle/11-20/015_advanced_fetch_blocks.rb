{}.fetch(:foo) do |key|
  puts "Missing key: #{key}"
end
