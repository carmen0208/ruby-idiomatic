# examples 
require 'json'
require 'English'
require 'pp'
def rfc822_to_json(input)
  headers = {}
  record_sep = "\r\n"
  pp input
  input.each_line(record_sep) do |line|
    fields = line.split(/:\s*/)
    break if fields.size < 2
    headers[fields[0]] = fields[1].chomp(record_sep)
  end 

  JSON.pretty_generate(headers) 
end
 
puts rfc822_to_json('040_data.txt')
