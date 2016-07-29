#---
# Excerpted from "Metaprogramming Ruby 2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr2 for more book information.
#---

require 'pry'

pry = Pry.new
pry.memory_size = 101
pry.memory_size        # => 101
pry.quiet = true

require_relative '../test/assertions'
assert_equals 101, pry.memory_size

Pry.memory_size       # => 100

assert_equals 100, Pry.memory_size

pry.refresh(:memory_size => 99, :quiet => false)
pry.memory_size       # => 99
pry.quiet             # => false

assert_equals 99, pry.memory_size

#pry_instance.rb
# ​
# ​def​ refresh(options={})
#   defaults   = {}
#   attributes = [ :input, :output, :commands, :print, :quiet,
#                  :exception_handler, :hooks, :custom_completions,
#                  :prompt, :memory_size, :extra_sticky_locals ]
#   attributes.each ​do​ |attribute|
#     defaults[attribute] = Pry.send attribute
#   ​end​
# ​
#   ​# ...​
# ​
#   defaults.merge!(options).each ​do​ |key, value|
#     send(​"​#{key}​="​, value) ​if​ respond_to?(​"​#{key}​="​)
#   ​end​
#   true
# ​end​
