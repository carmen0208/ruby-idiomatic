def vis(file)
  output = ""
  offset = file.tell
  file.rewind
  content = file.read.chars
  indices = content.map.with_index{|_,i| i}
  [indices, content].each do |collection|
    collection.each_with_index do |element, i|
      print "%3s" % element.to_s.sub(/\n/, '\n') 
    end
    print "\n"
  end
  print "   " * offset
  print " ^^\n"
  file.seek(offset, IO::SEEK_SET)
  print output
end


file = open('/var/log/system.log') # => 
file.seek(-512, IO::SEEK_END) # => 
chuck = file.read # !> assigned but unused variable - chuck
chunk.chars.count("\n")
# ~> -:20:in `initialize': No such file or directory @ rb_sysopen - /var/log/syslog (Errno::ENOENT)
# ~> 	from -:20:in `open'
# ~> 	from -:20:in `<main>'
