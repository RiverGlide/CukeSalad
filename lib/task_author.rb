def in_order_to do_something, *map, &block
  attr_map = map[0]
  unless do_something =~ /(([A-Z])+([a-z])+)+/
    name = Director.new.class_name_from do_something #TODO: This shouldn't be the director
  else
    name = do_something
  end
  m = Module.new do
    define_method :perform_task, &block
    define_method :the do | value |
      value_of( attr_map.key value )
    end
  end
  Kernel.const_set name, m
end
