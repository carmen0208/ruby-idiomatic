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

* [[ruby doc - CSV|http://ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html]]

####copy rights
* Copy right: pluralsight -> ruby idiomatic
