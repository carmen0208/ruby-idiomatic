# vague arguments(columns[1,3,5]...)
open('sample2.netrc').each_line do |line|
  columns  = line.split
  machine = columns[1]
  login = columns[3]
  password = columns[5]
  puts "#{machine}: #{login} / #{password}"
end

# eliminate the vague columns
open('sample2.netrc').each_line do |line|
  ignored,machine,ignored,login,ignored,password  = line.split
  puts "#{machine}: #{login} / #{password}"
end

# using ignored arguments in ruby
def netrc_entries
  open('sample2.netrc').each_line do |line|
    yield(*line.split)
  end
end

netrc_entries do |_,machine,_,login,_,password|
    puts "#{machine}: #{login} / #{password}"
end


# >> carmen0208.github.io: carmen / carmen
# >> ninja.com: admin / admin
# >> carmen0208.github.io: carmen / carmen
# >> ninja.com: admin / admin
# >> carmen0208.github.io: carmen / carmen
# >> ninja.com: admin / admin
