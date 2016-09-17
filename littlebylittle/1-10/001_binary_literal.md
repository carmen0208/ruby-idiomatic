####literal integers, floating point numbers, and strings.
```ruby
42
3.14159
"foo"
```
####hexidecimal and octal numbers
```ruby
0x7FFF # => 32767
0755   # => 493
```
####Octal numbers are useful for things like specifying unix file permissions.

```ruby
require 'fileutils'
include FileUtils

chmod 0755, 'somefile'
```

####Ruby also supports a slightly less common type of integer literal: **binary literals**
```ruby
#user, group, other.
#rwxrwxrwx
###ob prefix stands for binary
0b111101101

chmod perms, 'somefile'
####
```ruby
perms = 0b111101101
 => 493
perms.to_s
 => "493"
perms.to_s(8)
 => "755"
perms.to_s(16)
 => "1ed"
```
####[[FileUtil|https://ruby-doc.org/stdlib-2.2.3/libdoc/fileutils/rdoc/FileUtils.html]] --- util to modify file in ruby
