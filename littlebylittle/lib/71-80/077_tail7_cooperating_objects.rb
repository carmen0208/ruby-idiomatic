
class BackwardChunckedFileRead
  attr_reader :file, :chunk_size,:next_chunk_offset

  def initialize(file,chunk_size= 512)
   @file = file
   @chunk_size = chunk_size
   @next_chunk_offset  = -@chunk_size
   @chunk_start_offset = nil
  end
  
  def each_chunk
    while chunk = read_chunk
      yield(chunk)
    end
    ""
  end

  def read_chunk
    return nil if @chunk_start_offset == 0
    file.seek(next_chunk_offset , IO::SEEK_END) # => 0, 0
    @chunk_start_offset = file.tell # => 283262, 282750
    chunk = file.read(chunk_size)
 
    @next_chunk_offset -= chunk_size # => -1024, -1536
    chunk
  end

end


 #def each_chunk(file)

 #  chunk_size = 512
 #  next_chunk_offset = -chunk_size
 #  begin
 #    file.seek(next_chunk_offset , IO::SEEK_END) # => 
 #    chunk_start_offset = file.tell # => 
 #    chunk = file.read(chunk_size)
 #    yield(chunk)
 #    #newline_count += chunk.chars.count("\n") # => 12
 #    next_chunk_offset -= chunk_size # => 

 #  end while  chunk && chunk_start_offset > 0 
 #  ""
 #end

#def each_reverse_newline_index(chunk)
#  while(nl_index = chunk.rindex("\n", (nl_index||chunk.size)-1))
#    yield(nl_index)
#  end
#  nl_index
#end
def each_reverse_newline_index_with_chunk(chunk_source)
  chunk_source.each_chunk do |chunk|
    while(nl_index = chunk.rindex("\n", (nl_index||chunk.size)-1))
      yield(nl_index, chunk)
    end
  end
  nl_index
end



#newline_count = 0
file = open('/var/log/system.log') # => #<File:/var/log/system.log>
read= BackwardChunckedFileRead.new(file)
newlines = to_enum(:each_reverse_newline_index_with_chunk, read)
10.times do newlines.next end 
nl_index, chunk = newlines.next
start_text = chunk[(nl_index+1)..-1]
#p newline_count 
#p nl_index 
#this method only hold current chunk
print(start_text)
#it provide a way  to get all rest of data through read the filr from current offset
IO.copy_stream(file, $stdout)
# >> Dec 16 09:01:53 carmens-MacBook-Pro Netdisk_Mac[412]: postMessage end->[Idle]
# >> Dec 16 09:01:53 carmens-MacBook-Pro Netdisk_Mac[412]: status item tip:同步完成
# >> Dec 16 09:01:53 carmens-MacBook-Pro Netdisk_Mac[412]: -[StatusItemWindowController syncStatusChanged:] ---- staus changed received
# >> Dec 16 09:01:54 carmens-MacBook-Pro Netdisk_Mac[412]: Successful save user setting
# >> Dec 16 09:02:21 --- last message repeated 1 time ---
# >> Dec 16 09:02:21 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
# >> Dec 16 09:03:12 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
# >> Dec 16 09:04:02 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
# >> Dec 16 09:04:52 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
# >> Dec 16 09:05:43 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
# >> Dec 16 09:01:53 carmens-MacBook-Pro Netdisk_Mac[412]: postMessage end->[Idle]
# >> Dec 16 09:01:53 carmens-MacBook-Pro Netdisk_Mac[412]: status item tip:同步完成
# >> Dec 16 09:01:53 carmens-MacBook-Pro Netdisk_Mac[412]: -[StatusItemWindowController syncStatusChanged:] ---- staus changed received
# >> Dec 16 09:01:54 carmens-MacBook-Pro Netdisk_Mac[412]: Successful save user sett
