class Kao
  attr_reader :author
  def initialize (author:)
    @author = author
  end
end

puts Kao.new(author:"123123").author