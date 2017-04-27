require 'active_support'
class Record
  include ActiveSupport::Callbacks

  define_callbacks :save

  def save
    run_callbacks :save do 
      puts "-save"
    end
  end
end

class PersonRecord < Record
  set_callback :save, :before, :saving_message
  def saving_message
    puts "saving..."
  end

  set_callback :save, :after do |object|
    puts "saved"
  end
end


person = PersonRecord.new
person.save

#define_callbacks
# def define_callbacks(*names)
#   options = names.extract_options!
#
#   names.each do |name|
#     class_attribute "_#{name}_callbacks", instance_writer: false
#     set_callbacks name, CallbackChain.new(name, options)
#
#     module_eval <<-RUBY, __FILE__, __LINE__ + 1
#       def _run_#{name}_callbacks(&block)
#         __run_callbacks__(_#{name}_callbacks, &block)
#       end
#     RUBY
#   end
# end
#
# def set_callbacks(name, callbacks) # :nodoc:
#   send "_#{name}_callbacks=", callbacks
# end

#set_callback :save, :before, :saving_message

# def set_callback(name, *filter_list, &block)
#   type, filters, options = normalize_callback_params(filter_list, block)
#   self_chain = get_callbacks name
#   mapped = filters.map do |filter|
#     Callback.build(self_chain, filter, type, options)
#   end
#
#   __update_callbacks(name) do |target, chain|
#     options[:prepend] ? chain.prepend(*mapped) : chain.append(*mapped)
#     target.set_callbacks name, chain
#   end
# end

# run_callbacks
# def __run_callbacks__(callbacks, &block)
#   if callbacks.empty?
#     yield if block_given?
#   else
#     runner = callbacks.compile
#     e = Filters::Environment.new(self, false, nil, block)
#     runner.call(e).value
#   end
# end