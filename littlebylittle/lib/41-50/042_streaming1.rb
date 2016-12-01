require_relative '050_memstats'
require 'csv'

p memstats #=> "Size: 8572"

count = 0
crimes = CSV.foreach('example.csv', headers: true) do |v|
  count += 1 if v["ucr_ncic_code"]=~ /2404/
end
p count
p memstats #=> "Size: 10020"
# CSV.open('example.csv', header:true) do |csv|
  
