require 'net/http'


class CacheHTTP < Net::HTTP
  #def initialize(*args)
  # Naked splat, because args are useless
  def initialize(*)
    @cache = {}  
    #super with no parentheses after it will implicitly pass along all of the arguments
    super
  end

  def request(request, *) 
    super 
    #...store result in the cache ....
  end
end
