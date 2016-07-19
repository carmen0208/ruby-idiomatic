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

* Copy right: pluralsight -> ruby idiomatic
