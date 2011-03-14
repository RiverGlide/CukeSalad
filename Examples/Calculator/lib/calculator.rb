class Calculator
  
  attr_reader :display
  
  def initialize
    @display = 0
    @result = 0
    @next_operator = :display
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
    send @next_operator
  end
  alias :equals :do_calculation
 
  def plus
    @result + @display
  end
 
  def minus 
    @result - @display
  end
end
