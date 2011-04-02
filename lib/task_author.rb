def in_order_to do_something, *map, &block
  attr_map = map[0]
  m = Module.new do
    define_method :perform_task, &block
    define_method :the do | value |
      value_of( attr_map.key value )
    end
  end
  Kernel.const_set do_something, m
end
