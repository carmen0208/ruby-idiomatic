h = Hash.new do |hash, missing_key|
  hash[missing_key] = 0
end

puts h.default_proc #=> #<Proc:0x007fb6c41be8d8@032_hash_default_blocks_refact1.rb:21>
puts h.default_proc.call({}, :foo) #=> 0


# divergent below:
config = Hash.new do |h,k|
  h[k] = Hash.new(&h.default_proc)
end

config[:production][:database][:adapter] = 'mysql'
puts config[:production][:database][:adapter] # => "mysql"
