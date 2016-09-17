###003: Character Literals
 * Ruby does not have a character data type distinct from the String type. However, Ruby does have a **character literal syntax***. To quote a single character, just precede the character with a question mark:
 
```ruby
?c
=>99
?q
=>113
```
```ruby
case $stdin.getc.downcase
when ?y then puts "Proceeding..."
when ?n then puts "Aborting."
else puts "I don't understand"
end
```
