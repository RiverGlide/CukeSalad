def in_order_to do_something, *map, &block
  attr_map = map[0]
  name = do_something.as_const_name
  m = Module.new do
    define_method :perform_task, &block
    define_method :the do | value |
      value_of( attr_map.key value )
    end
  end
  Kernel.const_set name, m
end
