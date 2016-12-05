KEYS = ('a'..'z').to_a   # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
VALUES = KEYS.rotate(13)  # => ["n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m"]
CHYPHER = Hash[KEYS.zip(VALUES)]

def sekrit(text)
  text.downcase.chars.map { |char|
    CHYPHER[char] || char
  }.join
end

ARGF.each_line do |line|
  print "#{ARGF.path}: #{sekrit(line)}"
end

#command line: ruby 058_ARGF.rb file1.txt  file2.txt
#=> file1.txt: secret stuff from file one
#=> file2.txt: this is also from file one
#
#ruby 058_ARGF.rb < file1.txt
#-: secret stuff from file one
