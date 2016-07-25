#---
# Excerpted from "Metaprogramming Ruby 2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr2 for more book information.
#---
require 'I18n'

I18n.config.available_locales = :en
I18n.enforce_available_locales = true

require "monetize"

bargain_price = Monetize.from_numeric(99, "USD")
bargain_price.format # => "$99.00"

require_relative '../test/assertions'
assert_equals "$99.00", bargain_price.format

require "monetize"

standard_price = 100.to_money("USD")
standard_price.format # => "$100.00"

assert_equals "$100.00", standard_price.format

​# this follow comments class is the reason why we can use to_money method

# ​class​ Numeric
#   ​def​ to_money(currency = nil)
#     Monetize.from_numeric(self, currency
#     || Monetize.default_currency)
#   ​end​
# ​end​
