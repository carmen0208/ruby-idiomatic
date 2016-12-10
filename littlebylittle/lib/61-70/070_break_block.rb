def names
  yield "Ylva"
  yield "Brighid"
  yield "Shifra"
  yield "Yesamin"
ensure
  puts "Carmen"
end

names do |name|
  puts name
  break if name =~ /^S/
end
# >> Ylva
# >> Brighid
# >> Shifra
# >> Carmen
