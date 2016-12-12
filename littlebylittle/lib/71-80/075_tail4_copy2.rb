newline_count = 0
chunk_size = 512
next_chunk_offset = -chunk_size
file = open('/var/log/system.log') # => #<File:/var/log/system.log>
begin
  file.seek(next_chunk_offset , IO::SEEK_END) # => 0, 0
  chunk_start_offset = file.tell # => 311901, 311389
  chunk = file.read(chunk_size)
  while(nl_index = chunk.rindex("\n", (nl_index||chunk.size)-1))
    nl_index # => 511, 420, 204, 113, 22, 481, 398, 267, 184, 106, 20
    newline_count += 1 # => 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
    break if newline_count > 10
  end
  #newline_count += chunk.chars.count("\n") # => 12
  next_chunk_offset -= chunk_size # => -1024, -1536

end while  chunk && chunk_start_offset > 0 && newline_count <= 10

#p newline_count 
#p nl_index 
#this method only hold current chunk
puts chunk[(nl_index+1)..-1]
#it provide a way  to get all rest of data through read the filr from current offset
IO.copy_stream(file, $stdout)
# >> Dec 13 10:00:01 carmens-MacBook-Pro Netdisk_Mac[412]: postMessage enter->onEnterIdle:
# >> Dec 13 10:00:01 carmens-MacBook-Pro Netdisk_Mac[412]: postMessage end->[Idle]
# >> Dec 13 10:00:01 carmens-MacBook-Pro Netdisk_Mac[412]: status item tip:同步完成
# >> Dec 13 10:00:01 carmens-MacBook-Pro Netdisk_Mac[412]: -[StatusItemWindowController syncStatusChanged:] ---- staus changed received
# >> Dec 13 10:00:02 carmens-MacBook-Pro Netdisk_Mac[412]: Successful save user setting
# >> Dec 13 10:00:08 --- last messa
# >> ge repeated 1 time ---
# >> Dec 13 10:00:08 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
# >> Dec 13 10:00:58 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
# >> Dec 13 10:01:01 carmens-MacBook-Pro com.apple.xpc.launchd[1] (com.apple.quicklook[71116]): Endpoint has been activated through legacy launch(3) APIs. Please switch to XPC or bootstrap_check_in(): com.apple.quicklook
# >> Dec 13 10:01:48 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
