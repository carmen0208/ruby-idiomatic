## Minitest

 * [example](053_selective_run_test_minitest.rb)

 ```sh
 #commands that can try and run
 # run whole file
 ruby 053_selective_run_test_minitest.rb -v
 # run method
 ruby 053_selective_run_test_minitest.rb -v --name=test_addition
 # run methods that include names
 ruby 053_selective_run_test_minitest.rb -v --name=/addition/
 ```

## Respec

 * [example](053_selective_run_test_rspec.rb)

 ```sh
 #commands that can try and run
 # run whole file
 rspec -fd 053_selective_run_test_rspec.rb
 # run method
 rspec -fd 053_selective_run_test_rspec.rb -e 'subtracts numbers'
 # run methods that include names
 rspec -fd 053_selective_run_test_rspec.rb -e 'adds'
 ```

