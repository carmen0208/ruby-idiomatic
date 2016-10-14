class Bag
  def draw(text)
    puts text
  end

end

module AdsPlugin
  def draw(*)
    puts "copyright: Ninja Company!"
    super
  end

end

class Manufactory
  attr_accessor :client, :bag
  def initialize
    bag = Bag.new
    # @client = Client.new(bag.method(:draw))
    @client = Client.new(bag)
    bag.extend(AdsPlugin)
  end

  def draw
    @client.draw
  end
end

class Client
  attr_accessor :bag
  def initialize bag
    @bag = bag
  end

  def draw
    # @bag.call("I love my Bag!")
    @bag.draw("I love my Bag!")
  end
end

d = Manufactory.new.draw