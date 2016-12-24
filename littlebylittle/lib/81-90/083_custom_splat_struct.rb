require 'netrc'

netrc = Netrc.read('sample.netrc') # => #<Netrc:0x007fff0095df60 @new_item_prefix="", @path="sample.netrc", @pre="", @data=[["machine ", "carmen0208.github.io", "\n  login ", "carmen", "\n  password ", "carmen", "\n"], ["machine ", "ninja.com", "\n  login ", "admin", "\n  password ", "admin", "\n"]], @default=nil>
#netrc['ninja.com'] # => #<struct Netrc::Entry login="admin", password="admin">
access = netrc['carmen0208.github.io']

#version1: hard to read:
access[0] # => "carmen"
access[1] # => "carmen"

# version2: better
login, password = netrc['carmen0208.github.io']
login # => "carmen"
password # => "carmen"

#version3 the best

class Netrc
  Entry = Struct.new(:login, :password) # !> already initialized constant Netrc::Entry
end

entry = Netrc::Entry.new('carmen login','carmen password')
entry.login # => "carmen login"
entry.password # => "carmen password"
entry[:login] # => "carmen login"
entry[:password] # => "carmen password"
entry[0] # => "carmen login"
entry[1] # => "carmen password"

