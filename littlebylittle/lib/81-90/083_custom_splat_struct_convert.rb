require 'netrc'

netrc = Netrc.read('sample.netrc') # => #<Netrc:0x007fb490915c20 @new_item_prefix="", @path="sample.netrc", @pre="", @data=[["machine ", "carmen0208.github.io", "\n  login ", "carmen", "\n  password ", "carmen", "\n"], ["machine ", "ninja.com", "\n  login ", "admin", "\n  password ", "admin", "\n"]], @default=nil> # !> assigned but unused variable - netrc

class Netrc
  Entry = Struct.new(:login, :password) # !> previous definition of Entry was here
end

entry = Netrc::Entry.new('carmen login','carmen password')
entry.login # => "carmen login"
entry.password # => "carmen password"
entry[:login] # => "carmen login"
entry[:password] # => "carmen password"
entry[0] # => "carmen login"
entry[1] # => "carmen password"

## Problem:
#can be explicitly splat
login, password = *entry
login  # => "carmen login"
password # => "carmen password"

# but it can't be implicitly splat, because it not array-like
login, password = entry
login # => #<struct Netrc::Entry login="carmen login", password="carmen password">
password # => nil

# it can't be implicitly splat, because it not array-like
['carmen login','carmen password'].respond_to?(:to_ary) # => true
entry.respond_to?(:to_ary) # => false

## Fix it:
#Makes it array like

class Netrc
  Entry = Struct.new(:login, :password) do # !> already initialized constant Netrc::Entry
    alias_method :to_ary, :to_a
  end
end
entry = Netrc::Entry.new('carmen2', 'carmen pass2')
login, password = entry
login # => "carmen2"
password # => "carmen pass2"



