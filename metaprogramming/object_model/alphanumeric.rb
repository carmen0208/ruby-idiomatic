#---
# Excerpted from "Metaprogramming Ruby 2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr2 for more book information.
#---
def to_alphanumeric(s)
  s.gsub(/[^\w\s]/,'')
end

require 'minitest/autorun'

class ToAlphanumericTest < Minitest::Test
  def test_strip_non_alphanumeric_characters
    assert_equal '3 the Magic Number', to_alphanumeric('#3, the *Magic, Number*?')
  end
end

#this is a example of Ruby can open an class and make a method directly

class String
  def to_alphanumeric
    gsub(/[^\w\s]/, '')
  end
end


require 'minitest/autorun'

class StringExtensionsTest < Minitest::Test
  def test_strip_non_alphanumeric_characters
    assert_equal '3 the Magic Number', '#3, the *Magic, Number*?'.to_alphanumeric
  end
end
