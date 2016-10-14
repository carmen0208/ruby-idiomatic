def user_name(params)
  "#{params.fetch(:fname)} #{params.fethc(:lname)}"
end

def greet(params)
  name = user_name(params) rescue "Anonymous"
  puts "Hello, #{name}"
end

p greet({}) #=> Hello, Anonymous
###their is an issue, even we put the data, it could not be show currently and
#without any right output
#because of typo in the first method
p greet({fname:"Jane", lname: "Doe"}) #=> Hello, Anonymous
