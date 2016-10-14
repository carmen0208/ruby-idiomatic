require 'singleton'
class Snowflake
  include Singleton
end

p Snowflake.instance #=><Snowflake:0x007fa58c8d02c8>
p Snowflake.instance #=><Snowflake:0x007fa58c8d02c8>

