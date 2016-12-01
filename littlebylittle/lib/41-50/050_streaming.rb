require_relative '050_memstats'
require 'csv'

p memstats #=> "Size: 8572"

p crimes = CSV.read('example.csv', headers: true)
p crimes.count{|c| c["ucr_ncic_code"] =~ /2404/}

p memstats #=> "Size: 21476"
# CSV.open('example.csv', header:true) do |csv|
  
