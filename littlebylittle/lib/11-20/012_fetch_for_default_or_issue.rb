require 'pp'
require 'logger'
class NullLogger
  def method_missing(*)
  end
end

options = {logger: false}

logger = options[:logger] || Logger.new($stdout)
unless logger
  logger = NullLogger.new
end
pp logger
#<Logger:0x007f9d5a0b3ea8
#@default_formatter=#<Logger::Formatter:0x007f9d5a0b3e30 @datetime_format=nil>,
#@formatter=nil,
#@level=0,
#@logdev=
# #<Logger::LogDevice:0x007f9d5a0b3d90
#  @dev=#<IO:<STDOUT>>,
#  @filename=nil,
#  @mutex=
#   #<Logger::LogDevice::LogDeviceMutex:0x007f9d5a0b3d68
#    @mon_count=0,
#    @mon_mutex=#<Mutex:0x007f9d5a0b3cc8>,
#    @mon_owner=nil>,
#  @shift_age=nil,
#  @shift_size=nil>,
#@progname=nil>
