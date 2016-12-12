
## How to copy the file to our stream

* Way 1

   * [exampe](075_tail4_copy.rb)

   ```ruby
   while(data = file.read(chunk_size))
     print(data)
   end
   ```


* Way 2(recommand one)

   * [exampe](075_tail4_copy2.rb)

   ```ruby
   IO.copy_stream(file, $stdout)
   ```
