module M
  def self.append_feature(base);end

end

class C
  include M
end

class B

end

p C.ancestors  #=>[C, M, Object, Kernel, BasicObject]

p B.ancestors #=>[B, Object, Kernel, BasicObject]

# As the code above shows, by overriding append_features you can prevent
# a module from being included at all.
# Interestingly, that’s exactly what Concern wants to do, as we’ll see soon.