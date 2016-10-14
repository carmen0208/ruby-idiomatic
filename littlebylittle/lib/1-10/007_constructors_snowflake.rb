#this is a class to show how to caching and get a single instance
class Snowflake
  class << self
    private :new
  end
  def self.instance
    @instance ||= new
  end
end

p Snowflake.instance #=><Snowflake:0x007fa58c8d02c8>
p Snowflake.instance #=><Snowflake:0x007fa58c8d02c8>

p Snowflake.new #=>007_constructors_snowflake.rb:14:in `<main>': private method `new' called for Snowflake:Class (NoMethodError) 
