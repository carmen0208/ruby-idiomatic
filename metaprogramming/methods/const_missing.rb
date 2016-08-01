#---
# Excerpted from "Metaprogramming Ruby 2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr2 for more book information.
#---
require 'rake'
task_class = Task

puts task_class #=>Rake::Task

require_relative '../test/assertions'
assert_equals Rake::Task, task_class

# Rake::Module 
# def const_missing(const_name)
#   case const_name
#   when :Task
#     Rake.application.const_warning(const_name)
#     Rake::Task
#   when :FileTask
#     Rake.application.const_warning(const_name)
#     Rake::FileTask
#   when :FileCreationTask
#     # ...
#     Rake.application.const_warning(const_name)
#     Rake::FileCreationTask
#   when :RakeApp
#     Rake.application.const_warning(const_name)
#     Rake::Application
#   else
#     rake_original_const_missing(const_name)
#   end
# end
