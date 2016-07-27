#---
# Excerpted from "Metaprogramming Ruby 2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr2 for more book information.
#---
module Printable
  def print
    # ...
      "Printable#print()"
  end

  def prepare_cover
    # ...
  end
end


module Document
  def print_to_screen
    prepare_cover
    format_for_screen
    print
  end

  def format_for_screen
    # ...
  end

  def print
    # ...
    "Document#print()"
  end
end

class Book
  #those 2 modules all has print method,
  #makes sure which one need to be load be included in the last
  include Printable
  include Document

  # ...
end

b = Book.new
b.print_to_screen

puts Book.ancestors  # => [Book, Document, Printable, Object, Kernel, BasicObject]

require_relative "../test/assertions"
assert_equals [Book, Document, Printable, Object, Kernel, BasicObject], Book.ancestors
