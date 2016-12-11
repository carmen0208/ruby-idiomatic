file = open('small.txt') # => #<File:small.txt>
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

#Every open file has a file offset associated with it
#Reading from the file advances the offset. 
#Let’s read seven bytes and then look at the state of the file.
file.read(7) # => "Hello, "
#ask the file what its current offset
file.tell # => 7
#directly adjust the file offset
file.seek(11) # => 0
#adjusts the offset relative to the beginning of the file
file.seek(-4, IO::SEEK_CUR) # => 0
#argument of zero relative to the end of the file<Paste>
file.seek(0, IO::SEEK_END) # => 0
file.tell # => 19
#if we had finished reading the file
file.eof? # => true
file.seek(-11,IO::SEEK_END) # => 0
vis(file)
# >>   0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18
# >>   H  e  l  l  o  ,     R  u  b  y  T  a  p  a  s  ! \n \n
# >>                          ^^
