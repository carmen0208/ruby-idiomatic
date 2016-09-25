require 'pp'
require 'logger'
class NullLogger
  def method_missing(*)
  end
end

options = {logger: false}

logger = options.fetch(:logger){Logger.new($stdout)}
unless logger
  logger = NullLogger.new
end
pp logger
#=>#<NullLogger:0x007fadaa0d3c70>
