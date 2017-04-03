require 'data_mapper'
module GemLove
  class User
    include DataMapper::Resource

    property :login, String, key: true
  end
end
