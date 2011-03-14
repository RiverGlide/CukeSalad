class Calculator
  
  attr_reader :display
  
  def initialize
    @display = 0
    @result = 0
  end
  
  def enter value
    @display = value
  end
  
  def plus
    get_ready_to :add
  end
  
  def minus
    get_ready_to :subtract
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

  def add 
    @result + @display
  end
  
  def subtract 
    @result - @display
  end
end
