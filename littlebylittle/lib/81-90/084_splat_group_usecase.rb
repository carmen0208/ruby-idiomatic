menu = {
  'Jacked Up Turkey' => '$7.25',
  'New York Mikey'       => '$7.25',
  'Apple Grilled Cheese' => '$5.25' 
}

menu.each_with_index do |*args|
  puts args.inspect
end
#
## Intermedia way
menu.each_with_index do |pair, i|
  name, price = pair
  puts "#{i}: #{name} (#{price})"
end

# Without Intermieda varible(Splat Group)
menu.each_with_index do |(name, price), i|
  puts "#{i}: #{name} (#{price})"
end


# >> [["Jacked Up Turkey", "$7.25"], 0]
# >> [["New York Mikey", "$7.25"], 1]
# >> [["Apple Grilled Cheese", "$5.25"], 2]
# >> 0: Jacked Up Turkey ($7.25)
# >> 1: New York Mikey ($7.25)
# >> 2: Apple Grilled Cheese ($5.25)
# >> 0: Jacked Up Turkey ($7.25)
# >> 1: New York Mikey ($7.25)
# >> 2: Apple Grilled Cheese ($5.25)
