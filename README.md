##Ruby Idiomatic

####Blocks

* Common usage and use cases:

  * what we want to do in one transaction

  ```ruby
  database.transaction do
    form_account.subtract_balance(100.0)
    to_account.add_balance(100.0)
  end
  ```

 * pass blocks that really managing the events instead of checking all the time to see if something happend

  ```ruby
  button.on_click do |click_event|
    create_new_user
  end
  ```

  ```ruby
  [1,2,3,4].map do |int|
    int * 2
  end
  ```
* Conditionals
 * Predicate methods

 ```ruby
 if 4.even?
   puts "4 is even"
 else
   puts "4 is odd"
 end
 ```
 * guard clauses

 ```ruby
 puts "4 is even" if 4.even?
 puts "4 is even" unless 4.odd?
 ```

 * conditional assignment

 ```ruby
 def best_player
   @best_players ||=database.lookup
 end

 def best_player
   @best_players ||=begin
    players = database.table(:players)
    sorted = players.order(:points)
    sorted.top(10)
   end
 end
 ```

* Symbols:
 * [[ruby doc - CSV|http://ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html]]

 * String -- mutable objects which means add, modify contents of strings...
   * if you need to compare to strings, Ruby will hae to compare their contents character by character, and if we wanted to use a string as a hash key, Ruby will have to generate that hash code character by character.
 * Symbols -- not mutable
 ```ruby
 :ruby + :awesome
 #=> NoMethodError
 :ruby == :ruby #=> true
 ```

  this simplicity means that Ruby can check if two symbols are equal and generate their hash codes extremely quickly.

  ```ruby
  :ruby.object_id #=> 323688
  :ruby.object_id #=> 323688
  ```
  if you write the same symbol twice or 1000 times in your Ruby program, ruby will only ever create a single object for that symbol.

  Ruby will only ever create a single object for that symbol, So symbols in some ways take the place of enums from other language.

  Internally Ruby can just keep a list of the possible symbols it has seen and our code can treat them like integers when it checks for equality or generates hash codes.

####Building Objects

* Unit Test
  * MiniTest
    * Simple
    * Standard Library
  * RSpec
   * Readablility
   * gem

####Enumerable is Our Pal
* Map

  ```ruby
  rows = [row1, row2, row3]
  movies = []
  rows.each do |row|
    movies << Movie.new(row)
  end
  movies # => [movie1, movie2, movie3]
  ```


####copy rights
* Copy right: pluralsight -> ruby idiomatic
