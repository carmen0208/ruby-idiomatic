File.delete 'dbfile' if File.exist? 'dbfile'

require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "dbfile"

# Initialize the database schema
ActiveRecord::Base.connection.create_table :ducks do |t|
  t.string  :name
end

#The first one is this: normally, a class gains instance methods by including a module.
# But validate is a class method on ActiveRecord::Base.
# How can Base gain class methods by including modules?
# This is the topic of the next chapter, Chapter 10, ​Active Support’s Concern Module​,
# where we’ll also look at the metaprogramming treasure trove that hides behind
# this assembly of modules

class Duck < ActiveRecord::Base
  # The validate method is a Class Macro (Class Macro) that takes a block
  # gems/activerecord-4.1.0/lib/active_record/validations.rb
  validate do
    errors.add(:base, "Illegal duck name.") unless name[0] == 'D'
  end
end


my_duck = Duck.new
#Ghost Method for my_dock.name
my_duck.name = "Donald"
my_duck.valid?         # => true
my_duck.save!

#gems/activerecord-4.1.0/lib/active_record.rb
#Active Record then uses autoload as a Class Macro (Class Macro) to
# register dozens of modules, a few of which you can see in the code above.
# As a result, Active Record acts like a smart Namespace (Namespace)
# that automatically loads all the bits and pieces that make up the library

# gems/activerecord-4.1.0/lib/active_record/base.rb
#ActiveRecord::Base The code above does nothing but extend or include tens of modules.
# (Plus one additional line, the call to run_load_hooks,
# that allows some of those modules to run their own configuration code
# after they’ve been autoloaded.) As it turns out, many of the modules
# included by Base also include even more modules.

# gems/activerecord-4.1.0/lib/active_record/persistence.rb
#save, save!,delete..


require_relative '../test/assertions'
assert my_duck.valid?

bad_duck = Duck.new(:name => "Ronald")
# because we adding a rule of the validate which is: Name has to start from D
assert !bad_duck.valid?

duck_from_database = Duck.first
duck_from_database.name         # => "Donald"

assert_equals "Donald", duck_from_database.name

duck_from_database.delete

File.delete 'dbfile' if File.exist? 'dbfile'
