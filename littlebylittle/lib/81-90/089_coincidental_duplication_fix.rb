module RoflRest

  # 1. log all errors
  # 2. raise an exception when the response status code is in the 500 range
  class ServerError < StandardError
  class Client
    def initialize(uri, logger = Logger.new($stderr))
      @uri = uri
      @logger = logger
    end

    def get(params = {})
      response = do_request(:get, params)
      log_error(response)
      raise_on_error(response)
    end

    def put(params= {})
      response = do_request(:put, params)
      log_error(response)
      raise_on_error(response)
    end

    def post(params = {})
      response = do_request(:post, params)
      log_error(response)
      raise_on_error(response)
    end

    # the root of the problem is that the base class # handle_error method
    # bundles up bothe true duplication and coincidental duplication.
    # we should makes a 2 methods
    def log_error(response)
      if response.code.to_i >= 500
        @logger.error "Request #{@uri} failed: #{response.code}"
      end
      response
    end
    def raise_on_error(response)
      if response.code.to_i >= 500
        raise ServerError, response.code
      end
      response
    end


    def do_request(method, params)
      # ...
    end
  end
end

class MyClient = RoflRest::Client
  def initialize
    super('http://example.com/foo/bar')
  end
  
  def get(params={})
    tries = 0
    begin
      response = do_request(:get, params)
      return response if response.code = '200'
      
      log_error(response)
      
      tries += 1
      sleep 5
    end while tried < 3
    # after 3 trieds, if not works, raise error
    raise ServerError, response.code
  end
end
