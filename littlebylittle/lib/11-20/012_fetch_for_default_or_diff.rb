require 'pp'
pp ({}[:foo] || :default)             # => :default
pp ({foo: nil}[:foo] || :default)     # => :default
pp ({foo: false}[:foo] || :default)   # => :default<Paste>

pp ({}.fetch(:foo){:default}) #=> default
pp ({foo: nil}.fetch(:foo){:default}) #=> nil
pp ({foo: false}.fetch(:foo){:default}) #=> false
