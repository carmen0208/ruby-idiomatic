
require 'stringio'
 
def capture_output
  fake_stdout = StringIO.new
  old_stdout = $stdout
  $stdout = fake_stdout
  Object.const_set(:STDOUT, fake_stdout)
  #When we wrap this around a puts statement, the output is captured to a string.
  yield
ensure
  $stdout = old_stdout
  Object.const_set(:STDOUT, old_stdout)
  return fake_stdout.string
end
 
output = capture_output do
  puts "This goes to standard out"
  STUDOUT.puts "This bypasses capture"
  system 'echo "output from a subprocess"'
end
output # => "This goes to standard out\n"
# >> This bypasses capture
