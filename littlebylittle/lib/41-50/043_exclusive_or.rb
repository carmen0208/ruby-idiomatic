
def replace_var(text, var_name, value=nil)
  unless block_given? ^ value
    raise ArgumentError, 
        "Either value or block must be given, but not both!"
  end
  p text.gsub!(/\{#{var_name}\}/) { value || yield }
end

text = "my {noun} is full of {noun}s"

replace_var("Hello, {name}", 'name', 'Carmen')

replace_var(text, 'noun') {
  "I don't  know where are you from"
}

#1. Error raise for lack of value
#replace_var(text,'noun')
#043_exclusive_or.rb:4:in `replace_var': Either value or block must be given, but not both! (ArgumentError)
#	from 043_exclusive_or.rb:20:in `<main>'

#2. Error raise for all values
replace_var(text,'noun','carmen') {
  "I don't know where are you from "
}
#043_exclusive_or.rb:4:in `replace_var': Either value or block must be given, but not both! (ArgumentError)
#	from 043_exclusive_or.rb:20:in `<main>'

require 'minitest/autorun'

#assert_raises(ArgumentError) {replace_var(text,'noun')}
