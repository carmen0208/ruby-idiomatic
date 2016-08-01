#---
# Excerpted from "Metaprogramming Ruby 2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr2 for more book information.
#---
require 'builder'
xml = Builder::XmlMarkup.new(:target=>STDOUT, :indent=>2)

xml.coder {
  xml.name 'Matsumoto', :nickname => 'Matz'
  xml.language 'Ruby'
}

# Builder --> BlankSlate
# # Hide the method named +name+ in the BlankSlate class.  Don't
# # hide +instance_eval+ or any method beginning with "__".
# def self.hide(name)
#   warn_level = $VERBOSE
#   $VERBOSE = nil
#   # ...
#   if instance_methods.include?(name._blankslate_as_name) &&
#       name !~ /^(__|instance_eval$)/
#     @hidden_methods ||= {}
#     @hidden_methods[name.to_sym] = instance_method(name)
#     undef_method name
#   end
# ensure
#   $VERBOSE = warn_level
# end
