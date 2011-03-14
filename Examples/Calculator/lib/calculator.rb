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
    equals
    @operator = :add
  end
  
  def minus
    equals
    @operator = :subtract
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
