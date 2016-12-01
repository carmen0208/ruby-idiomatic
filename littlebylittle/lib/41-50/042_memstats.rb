def memstats
  input = `ps ax -o pid,rss | grep -E "^[[:space:]]*#{$$}"`
 # p input.strip #=> "4350   7644\n"
  
 # p input.strip.split #=> ["4350", "7644"]
 # p input.strip.split.map(&:to_i) #=> [4350, 7644]
  pid, size = input.strip.split.map(&:to_i)
  "Size: #{size}"
end

#p memstats
