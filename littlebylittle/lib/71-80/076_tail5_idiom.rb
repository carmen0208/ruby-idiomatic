def each_chunk(file)
  chunk_size = 512
  next_chunk_offset = -chunk_size
  begin
    file.seek(next_chunk_offset , IO::SEEK_END) # => 0
    chunk_start_offset = file.tell # => 335116
    chunk = file.read(chunk_size)
    yield(chunk)
    #newline_count += chunk.chars.count("\n") # => 12
    next_chunk_offset -= chunk_size # => 

  end while  chunk && chunk_start_offset > 0 
  ""
end

def each_reverse_newline_index(chunk)
  while(nl_index = chunk.rindex("\n", (nl_index||chunk.size)-1))
    yield(nl_index)
  end
  nl_index
end


newline_count = 0
file = open('/var/log/system.log') # => #<File:/var/log/system.log>
start_text = each_chunk(file) do |chunk|
  nl_index = each_reverse_newline_index(chunk) do |index|   # !> assigned but unused variable - ln_index
    newline_count += 1 # => 
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
# ~> -:18:in `each_reverse_newline_index': undefined local variable or method `n1_index' for main:Object (NameError)
# ~> 	from -:27:in `block in <main>'
# ~> 	from -:8:in `each_chunk'
# ~> 	from -:26:in `<main>'
