require 'net/http'


class CacheHTTP < Net::HTTP
#not only is this a lot of work, it will break if the Net::HTTP interface ever
  #changes.
  def initialize(
    address,
    port = nil,
    p_addr = :ENV,
    p_port = nil,
    p_user = nil,
    p_pass = nil)
    @cache = {}
    #super(address,port,p_addr,p_port, p_user, p_pass)
    
    #super with no parentheses after it will implicitly pass along all of the arguments
    super
  end

  def request 
    super 
    #...store result in the cache ....
  end
end
