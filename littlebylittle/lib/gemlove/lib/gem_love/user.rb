require 'data_mapper'
module GemLove
  class User
    include DataMapper::Resource

    property :login, String, key: true
    property :client_key, String, default: ->(*) {SecureRandom.hex(16)}
  end
end
