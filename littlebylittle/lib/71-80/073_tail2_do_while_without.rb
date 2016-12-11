newline_count = 0
chunk_size = 512
next_chunk_offset = -chunk_size
file = open('/var/log/system.log') # => #<File:/var/log/system.log>
file.seek(next_chunk_offset , IO::SEEK_END) # => 0
chunk_start_offset = file.tell
chunk = file.read(chunk_size)
newline_count = chunk.chars.count("\n") # !> assigned but unused variable - new_line_count
while  chunk && chunk_start_offset > 0 && newline_count <= 10
  next_chunk_offset -= chunk_size # => -1024, -1536
  file.seek(next_chunk_offset, IO::SEEK_END)
  chunk_start_offset = file.tell # => 305226, 304714
  chunk = file.read(chunk_size) # => "m tip:\xE6\xAD\xA3\xE5\x9C\xA8\xE5\x90\x8C\xE6\xAD\xA5\nDec 12 11:03:38 carmens-MacBook-Pro Netdisk_Mac[412]: -[StatusItemWindowController syncStatusChanged:] ---- staus changed received\nDec 12 11:03:38 carmens-MacBook-Pro Netdisk_Mac[412]: postMessage start->[Sync]:[A_SyncEnd]\nDec 12 11:03:38 carmens-MacBook-Pro Netdisk_Mac[412]: postMessage leave->onLeaveSync:\nDec 12 11:03:38 carmens-MacBook-Pro Netdisk_Mac[412]: postMessage enter->onEnterIdle:\nDec 12 11:03:38 carmens-MacBook-Pro Netdisk_Mac[412]: postMessage end->[Idle]\nDec 12 11:03:38 carm", "ue is Empty\nDec 12 11:03:38 carmens-MacBook-Pro Netdisk_Mac[412]: diffSetComputer dealloc remove all map\nDec 12 11:03:38 carmens-MacBook-Pro Netdisk_Mac[412]: postMessage start->[Idle]:[A_NextTask]\nDec 12 11:03:38 carmens-MacBook-Pro Netdisk_Mac[412]: postMessage leave->onLeaveIdle:\nDec 12 11:03:38 carmens-MacBook-Pro Netdisk_Mac[412]: postMessage enter->onEnterSync:\nDec 12 11:03:38 carmens-MacBook-Pro Netdisk_Mac[412]: postMessage end->[Sync]\nDec 12 11:03:38 carmens-MacBook-Pro Netdisk_Mac[412]: status ite"
  newline_count += chunk.to_s.chars.count("\n") # => 6, 12
end

newline_count  # !> possibly useless use of a variable in void context
# >> 6
