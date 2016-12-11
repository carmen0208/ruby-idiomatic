## How could we read the end of 10 line file without loop or load the entire file?

#### Part1: Every open file has a file offset associated with it

  * [example](072_tail1_random_access.rb)

      ```ruby
      file.read(7)
      file.tell
      file.seek(11)
      file.seek(-512, IO::SEEK_END)
      ```

  * [usage](072_tail1_random_access_example.rb)

#### Part2: Read from the end, check if it contains 10 lines

  * [Example](073_tails2_do_while_without.rb)
  * [Better version: Example](073_tails2_do_while.rb)

   ```ruby
   begin
   ##...
   end while 
   #......
   ```
