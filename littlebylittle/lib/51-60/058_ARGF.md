## What's ARGF?

It’s a special kind of object which behaves like a read-only IO object. When you read from the ARGF object, Ruby first looks through the ARGV array. If it finds any arguments there, it treats them as filenames and tries to open them. Reading from ARGF then yields the content of each of those files in turn, as if they had all been concatenated into a single file.

[example](058_ARGF.rb)
