#---
# Excerpted from "Metaprogramming Ruby 2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr2 for more book information.
#---
# Computer as a Dynamic Proxy
require_relative 'data_source'

#see more info
#Object.instance_methods.grep /^d/   ​# => [:dup, :display, :define_singleton_method]​


class Computer < BasicObject
  def initialize(computer_id,data_source)
    @id = computer_id
    @data_source = data_source
  end

  def method_missing(name, *args)
    super unless @data_source.respond_to?("get_#{name}_info")
    info = @data_source.send("get_#{name}_info", @id)
    price = @data_source.send("get_#{name}_price", @id)
    result = "#{name.capitalize}: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end

end

cmp = Computer.new(0,DS.new)
puts cmp.mouse
puts cmp.respond_to?(:mouse)  # => false

class Computer
  def respond_to_missing?(method, include_private=false)
    @data_source.respond_to?("get_#{method}_info") ||super
  end
end

# puts cmp.respond_to?(:mouse)  # => true
