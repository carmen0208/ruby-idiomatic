newline_count = 0
chunk_size = 512
next_chunk_offset = -chunk_size
file = open('/var/log/system.log') # => #<File:/var/log/system.log>
begin
  file.seek(next_chunk_offset , IO::SEEK_END) # => 0, 0
  chunk_start_offset = file.tell
  chunk = file.read(chunk_size)
  newline_count += chunk.chars.count("\n")
  next_chunk_offset -= chunk_size # => -1024, -1536

end while  chunk && chunk_start_offset > 0 && newline_count <= 10

p newline_count  # !> possibly useless use of a variable in void context
