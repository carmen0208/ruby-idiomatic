def default
  42
  ## ...some expensive computation
end

#y = def default x
#      42 + x
#    end

#p answer.fetch("How many roads must a man walk down?", y(32))
answer ={}
## in this view, default is passing the value 42 instead of the whole message
#into
p answer.fetch("How many roads must a man walk down?", default) #=> 42
p answer.fetch("How many roads must a man walk down?", method(:default)) #=> <Method: Object#default>
