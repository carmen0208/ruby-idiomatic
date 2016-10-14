#fetch beyond Hash
a = [:x, :y, :z]
#a.fetch(3)
# ~> -:2:in `fetch': index 3 outside of array bounds: -3...3 (IndexError)
# ~>    from -:2:in `<main>'
 
port = ENV.fetch('PORT'){ 8080 }.to_i
port # => 8080

#Defaults for nested hashes
config1 = {
  database: {
    type: 'mysql',
    host: 'localhost'
  }
}

config2 = {}

p config2.fetch(:database){{}}
p config2.fetch(:database){{}}.fetch(:type){'sqlite'}

# => "sqlite"
