
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
    @chunk_start_offset = file.tell # => 404711, 404199
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

def each_reverse_newline_index(chunk)
  while(nl_index = chunk.rindex("\n", (nl_index||chunk.size)-1))
    yield(nl_index)
  end
  nl_index
end


newline_count = 0
file = open('/var/log/system.log') # => #<File:/var/log/system.log>
start_text = BackwardChunckedFileRead.new(file).each_chunk do |chunk|
  nl_index = each_reverse_newline_index(chunk) do |index|  
    newline_count += 1 # => 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
    break index if newline_count > 10
  end
  break chunk[((nl_index+1)..-1)] if newline_count > 10
end 

#p newline_count 
#p nl_index 
#this method only hold current chunk
print(start_text)
#it provide a way  to get all rest of data through read the filr from current offset
IO.copy_stream(file, $stdout)
# >> Dec 13 11:58:45 carmens-MacBook-Pro Netdisk_Mac[412]: -[StatusItemWindowController syncStatusChanged:] ---- staus changed received
# >> Dec 13 11:58:46 carmens-MacBook-Pro Netdisk_Mac[412]: Successful save user setting
# >> Dec 13 11:59:06 --- last message repeated 1 time ---
# >> Dec 13 11:59:06 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
# >> Dec 13 11:59:56 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
# >> Dec 13 12:00:46 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
# >> Dec 13 12:01:36 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
# >> Dec 13 12:02:27 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
# >> Dec 13 12:03:15 carmens-MacBook-Pro syslogd[38]: ASL Sender Statistics
# >> Dec 13 12:03:17 carmens-MacBook-Pro Screenhero[403]: JS Log: Strophe (1): _dataRecv called
