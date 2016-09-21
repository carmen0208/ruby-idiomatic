##simple string
```ruby
puts "ln -s file1 file2"
```

#####string concatenation
```ruby
command = "ln"
options = "-s"
arguments = "file1 file2"
 
puts command + options + arguments 
#=> command + options + arguments   
```

####splate operator
```ruby
command = ["ln"]
options = ["-s"]
arguments = ["file1", "file2"]
 
command + options + arguments
#=> ["ln", "-s", "file1", "file2"]
puts *(command + options + arguments)
#=>n
#=>-s
#=>file1
#=>file2

```
* advanced usage:
```ruby
puts **{x:100,y:200}
#=>{:x=>100, :y=>200}
puts *{x:100,y:200}
#=> x
#=> 100
#=> y
#=> 200
puts *[x:100,y:200]
#=>{:x=>100, :y=>200}
puts *["ln", "-s", "file1", "file2"]
#=>n
#=>-s
#=>file1
#=>file2
```
```ruby
#usage:
def say(what, *people)
  people.each{|person| puts "#{person}: #{what}"}
end
 
say "Hello!", "Alice", "Bob", "Carl"
# Alice: Hello!
# Bob: Hello!
# Carl: Hello!
people = ["Rudy", "Sarah", "Thomas"]
say "Howdy!", *people
# Rudy: Howdy!
# Sarah: Howdy!
# Thomas: Howdy!

```

* [more usage](http://blog.honeybadger.io/ruby-splat-array-manipulation-destructuring/)
//TODO: blog later
####convert words array into array

 With %W, we precede an array with %W, and then surround it with any delimiters we choose. Inside, we put the elements of the array. Each whitespace-delimited token becomes a string array element

```ruby
%W[file1 file2]  
#=> ["file1", "file2"]
```
* usage
   ```ruby
    width  = 960
    height = 600
    recording_options = %W[-f x11grab -s #{width}x#{height} -i 0:0+800,300 -r 30]
    recording_options 
    # => ["-f", "x11grab", "-s", "960x600", "-i", "0:0+800,300", "-r", "30"]
   misc_options      = %W[-sameq -threads 6]
   output_options    = %W[screencast.mp4]
 
  ffmpeg_flags =
      recording_options +
      misc_options +
      output_options
  #=> ["-f", "x11grab", "-s", "960x600", "-i", "0:0+800,300", "-r", "30", "-sameq", "-threads", "6", "screencast.mp4"] 
  system "ffmpeg", *ffmpeg_flags
   ```
