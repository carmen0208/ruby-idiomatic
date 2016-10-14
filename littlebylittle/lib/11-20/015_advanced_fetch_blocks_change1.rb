default = ->(key) do
  puts "#{key} not found , please enter it."
  gets
end

h= {}
name = h.fetch(:name, &default)
email = h.fetch(:email, &default)
