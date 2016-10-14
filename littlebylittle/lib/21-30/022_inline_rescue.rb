def user_name(params)
  params.fetch(:username)
end

p user_name(username: 'Frank') #=> "Frank"
#p user_name({})
#=>2:in `fetch': key not found: :username (KeyError)
	#from littlebylittle/21-30/022_inline_rescue.rb:2:in `user_name'
	#from littlebylittle/21-30/022_inline_rescue.rb:6:in `<main>'

def greet(params)
  name = user_name(params)
  puts "Hello, #{name}"
end

#p greet({})

# `fetch': key not found: :username (KeyError)
# from littlebylittle/21-30/022_inline_rescue.rb:2:in `user_name'
# from littlebylittle/21-30/022_inline_rescue.rb:12:in `greet'
# from littlebylittle/21-30/022_inline_rescue.rb:16:in `<main>'
#
def greet(params)
  name = user_name(params) rescue "Anonymous"
  puts "Hello, #{name}"
end

p greet({}) #=> Hello, Anonymous
