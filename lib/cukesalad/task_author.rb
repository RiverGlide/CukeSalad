require 'cukesalad/codify/const_name'
module CukeSalad
  module TaskAuthor

    def in_order_to do_something, *with_attributes, &actions
      TaskAuthor.in_order_to do_something, *with_attributes, &actions
    end

    def TaskAuthor.in_order_to do_something, *with_attributes, &actions
      attr_map = with_attributes[0]
      name = Codify::ConstName.from do_something
      m = Module.new do
        define_method :perform_task, &actions
        define_method :the do | value |
          value_of( attr_map.key value )
        end
      end
      Kernel.const_set name, m
    end
  end
end
