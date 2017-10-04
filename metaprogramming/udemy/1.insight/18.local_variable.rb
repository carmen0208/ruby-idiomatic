class MyClass 
  attr_reader :local_var
  def initialize
    @local_var = "Initialized Var"
  end

  def self.get_var
    @local_var
  end
  def change_var 
    @local_var = "Changed Var" 
  end 
end 

object1 = MyClass.new 
object1.local_var # => "Initialized Var"

object2 = MyClass.new 
object2.change_var # => "Changed Var"
object2.local_var # => "Changed Var"
object1.local_var # => "Initialized Var"

# self class get instance variables
Myclass.get_var # => 
# ~> -:23:in `<main>': uninitialized constant Myclass (NameError)
