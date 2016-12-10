def names 
  yield "Ylva"
  yield "Brighid"
  yield "Shifra"
  yield "Yesamin"
end

result = names do |name|
  puts name
  break name if name =~ /^S/
end
p "result = #{result}" 
# >> Ylva
# >> Brighid
# >> Shifra
# >> "result = Shifra"
