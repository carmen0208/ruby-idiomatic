#---
# Excerpted from "Metaprogramming Ruby 2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr2 for more book information.
#---
class MyClass
  def initialize
    @v = 1
  end
end

obj = MyClass.new
obj.instance_eval do
  puts self   # => #<MyClass:0x3340dc @v=1>
  puts @v          # => 1
end

require_relative "../test/assertions"

obj.instance_eval do
  assert_equals MyClass, self.class
  assert_equals 1, @v
end

v = 2
obj.instance_eval { @v = v }
obj.instance_eval { @v }      # => 2

assert_equals 2, obj.instance_eval { @v }


#The Padrino Example of  BREAKING ENCAPSULATION
#gems/padrino-core-0.11.3/test/test_logger.rb
#    context "static asset logging" do
    #   should 'not log static assets by default' do
    #     # ...
    #     mock_app do
    #       enable :logging
    #       get("/images/something.png"){ env["sinatra.static_file"] = '/public/images/something.png'; "Foo" }
    #     end
    #     get "/images/something.png"
    #     assert_equal "Foo", body
    #     assert_match "", Padrino.logger.log.string
    #   end
    #
    #   should 'allow turning on static assets logging' do
    #     Padrino.logger.instance_eval{ @log_static = true }
    #     # ...
    #     mock_app do
    #       enable :logging
    #       get("/images/something.png"){ env["sinatra.static_file"] = '/public/images/something.png'; "Foo" }
    #     end
    #     get "/images/something.png"
    #     assert_equal "Foo", body
    #     assert_match /GET/, Padrino.logger.log.string
    #     Padrino.logger.instance_eval{ @log_static = false }
    #   end
    # end
