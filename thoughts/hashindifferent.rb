class TestMethod
  def initialize(constructor = {})
    puts constructor if constructor.is_a?(Hash)
    #=>{:first_name=>"carmen", :last_name=>"liu", :cute_name=>"ninja"}
  end
end

TestMethod.new(first_name: "carmen", last_name: "liu", cute_name: "ninja")
