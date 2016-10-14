##if the value it the same, it returns the same instance, other than that, it
#would return the different instance.
#this is an example of rock-paper-scissors. only 3 moves, cache each of them:
class RpsMove

  def self.new(move)
    @cache ||={}
    @cache[move] ||= super(move)
  end

  def initialize(move)
    @move = move
  end
end

p RpsMove.new(:rock) #<RpsMove:0x007f855d07bd38 @move=:rock>
# same as last
p RpsMove.new(:rock) #<RpsMove:0x007f855d07bd38 @move=:rock>

#different
p RpsMove.new(:paper) #<RpsMove:0x007f855d07bb08 @move=:paper>


