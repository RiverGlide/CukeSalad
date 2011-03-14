class Calculator
  
  attr_reader :display
  
  def initialize
    @display = 0
    @result = 0
  end
  
  def enter value
    @display = value
  end
  
  def get_ready_to do_this
    @result = do_calculation
    @display = @result
    @next_operator = do_this
  end

  def do_calculation
    return [@result, @display].inject( @next_operator ) unless @next_operator.nil?
    @display
  end
  alias :equals :do_calculation
end
