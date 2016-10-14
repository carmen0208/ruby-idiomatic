def capture_output
  old_stdout = STDOUT.clone
  pipe_r, pipe_w = IO.pipe
  pipe_r.sync = true
  output = ""
  reader = Thread.new do 
    begin
      loop do 
        output << pipe_r.readpartial(1024)
      end
    rescue EOFError
    end
  end
  STDOUT.reopen(pipe_w)
  yield
ensure
  STDOUT.reopen(pipe_w)
  pipe_w.close
  reader.join
  return output
end

output = capture_output do 
  puts "This goes to standard out"
  STDOUT.puts "This tried to bypass capture"
  system 'echo "output from a subprocess"'
end

output.splie("\n")
