## In order to using Data mapper and sqlite

here's some commands that need to do 

```sh
brew install sqlite
gem install dm-sqlite-adapter
```

add put `dm-sqlite-adapter` into your gemfile

## install rspec
* create Gemfile and run command
   ```sh
bundle install --binstubs

   ```
* install rspec

   ```sh
   bin/rspec --init
   # => create   .rspec
   #=> create   spec/spec_helper.rb
   ```
* run rspec

   ```sh
    rspec
   ```

### Initialize a integration test
* start from a test it self and do TDD

here's the benefit:

* Gotten my testing infrastructure assembled and working
* written a high-level, two-line executable specification for the first user story.
* started to hash out the structure of my object model, guided by the test.
* Set up a persistence mechanism
* Most importantly, I’ve established a test-driven rhythm for my application 
from the get-go. Every step from here until completion will be either making a 
test pass, refactoring the resulting code, or improving my test suite to force 
more implementation changes. And since I’ve left myself a failing test with 
clear failure message, 
