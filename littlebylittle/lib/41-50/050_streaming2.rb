require_relative '050_memstats'
require 'csv'

p memstats #=> "Size: 8572"

CSV.open('example.csv', headers: true) do |csv|
  p crimes = csv.each
  #<Enumerator: <#CSV io_type:File io_path:"example.csv" encoding:UTF-8 lineno:0 col_sep:"," row_sep:"\r\n" quote_char:"\"" headers:true>:each>
  #it as a lazy version of the visitors Array we created in the very first 
  #version of this program
  p memstats
  crimes.count {|v| v["ucr_ncic_code"] =~ /2404/}
  p memstats
end
p memstats #=> "Size: 10020"
# CSV.open('example.csv', header:true) do |csv|
  
