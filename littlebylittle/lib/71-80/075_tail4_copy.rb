newline_count = 0
chunk_size = 512
next_chunk_offset = -chunk_size
file = open('/var/log/system.log') # => #<File:/var/log/system.log>
begin
  file.seek(next_chunk_offset , IO::SEEK_END) # => 0, 0
  chunk_start_offset = file.tell # => 307837, 307325
  chunk = file.read(chunk_size)
  while(nl_index = chunk.rindex("\n", (nl_index||chunk.size)-1))
    nl_index # => 511, 420, 329, 238, 147, 56, 3, 432, 301, 218, 140
    newline_count += 1 # => 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
    break if newline_count > 10
  end
  #newline_count += chunk.chars.count("\n") # => 12
  next_chunk_offset -= chunk_size # => -1024, -1536

end while  chunk && chunk_start_offset > 0 && newline_count <= 10

#p newline_count 
#p nl_index 
puts chunk[(nl_index+1)..-1]
#print(file.read)
while data = file.read(chunk_size)
  print(data)
end
# >> 11
# >> 140
# >> Dec 13 09:53:46 carmens-MacBook-Pro Netdisk_Mac[412]: postMessage end->[Idle]
# >> Dec 13 09:53:46 carmens-MacBook-Pro Netdisk_Mac[412]: status item tip:同步完成
# >> Dec 13 09:53:46 carmens-MacBook-Pro Netdisk_Mac[412]: -[StatusItemWindowController syncStatusChanged:] ---- staus changed received
# >> Dec 13 09:53:47 carmens-MacBook-Pro Netdisk_Mac[412]: Successful save user sett
# >> ing
# >> Dec 13 09:54:16 --- last message repeated 1 time ---
# >> Dec 13 09:54:16 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
# >> Dec 13 09:55:06 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
# >> Dec 13 09:55:56 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
# >> Dec 13 09:56:47 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
# >> Dec 13 09:57:37 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
