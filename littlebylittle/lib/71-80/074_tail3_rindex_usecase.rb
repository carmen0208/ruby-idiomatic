newline_count = 0
chunk_size = 512
next_chunk_offset = -chunk_size
file = open('/var/log/system.log') # => #<File:/var/log/system.log>
begin
  file.seek(next_chunk_offset , IO::SEEK_END) # => 0, 0
  chunk_start_offset = file.tell
  chunk = file.read(chunk_size)
  while(nl_index = chunk.rindex("\n", (nl_index||chunk.size)-1))
    nl_index # => 511, 420, 349, 258, 167, 76, 497, 406, 315, 224, 171
    newline_count += 1 # => 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
    break if newline_count > 10
  end
  #newline_count += chunk.chars.count("\n") # => 12
  next_chunk_offset -= chunk_size # => -1024, -1536

end while  chunk && chunk_start_offset > 0 && newline_count <= 10

p newline_count 
p nl_index 
puts chunk[(nl_index+1)..-1]
# >> 11
# >> 171
# >> Dec 12 11:47:30 --- last message repeated 1 time ---
# >> Dec 12 11:47:30 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
# >> Dec 12 11:48:20 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
# >> Dec 12 11:49:11 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
# >> Dec 12 11:50:0
