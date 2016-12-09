## How to caching things through HASH

* [API with out cache](066_caching_an_api.rb)

#### Why Cacheing?

In a production application, hitting an external service every time the program needs data is often a bad idea

* Making a request every time the #report method is called could slow the program down
* if requests are made often enough they might exceed service-imposed limits, causing future requests to fail
#### How to cache it?

```ruby
#cache is like this 
# 17361 is key, the rest of it is a value
weather = Weather.new(cache: {'17361'=> Weather::Report.new(-60.0)} )
##here's how to use it 
 def report(query)
    #fetch the cache it could, it fetch it, it would not excute the other
    #function in blocks, this is a identity by HASH
    @cache.fetch(query) {
      body = open(url).read
      Report.new(data['current_observation']['temp_f'])
    }
  end

```

#### First Example of Caching

* [API with out cache](066_caching_an_api1.rb)
* [API with out cache](../../spec/066_caching_an_api_spec.rb)

**Problem? caching a Report object, which it a returning for whole function**

* Version Conflicts(temperature -> temp_f)
* Unused data is not cached
* Object must be serializable

#### Better version of cache

1. No version conflicts
   
   it’s better to cache raw response bodies—or sometimes even entire responses, including headers—than to cache domain objects.

2. Storing the entire response means that if we start using more of the response, the data will already be available in the cache
3. storing the response raw ensures that the data stored is a simple, serialization-friendly String


#### Refactoring Version(caching the only raw object from http)

* [API with out cache](066_caching_an_api2.rb)
* [API with out cache](../../spec/066_caching_an_api_spec1.rb)

## How to mock HTTP request
```ruby
require 'webmock/rspec'

#stub a request to get the back of th value.
json = '{ "current_observation": { "temp_f": -60.0 } }'
expected_url = 
%r(http://api.wunderground.com/api/.*/conditions/q/17361.json)
stub_request(:get, expected_url).to_return(body: json)
#.....
      
```

