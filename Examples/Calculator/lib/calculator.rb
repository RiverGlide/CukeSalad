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
    equals
    @operator = do_this
  end

  def equals
    @result = @display if @operator.nil?
    if !@operator.nil?
      @result = send @operator
      @display = @result
    end
  end

  def plus 
    @result + @display
  end
  
  def minus 
    @result - @display
  end
end
