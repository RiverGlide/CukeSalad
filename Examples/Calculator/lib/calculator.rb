class Calculator
  
  attr_reader :display
  
  def initialize
    @display = 0
  end
  
  def enter value
    @previous = @display
    @display = value
  end
  
  def get_ready_to do_this
    @display = do_calculation unless @next_operator.nil?
    @next_operator = do_this
  end

  def do_calculation
    [@previous, @display].inject( @next_operator )
  end
  alias :equals :do_calculation
end
