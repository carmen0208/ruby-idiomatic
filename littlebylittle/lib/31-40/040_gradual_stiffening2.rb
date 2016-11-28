# examples 
require 'json'
$/="\r\n"; $;=/:\s*/; headers={} 
IO.foreach(ARGV[0]) do
  fields = $_.split
  break if fields.size 
  headers[fields[0]] = fields[1].chomp
end 

puts JSON.pretty_generate(headers) 

