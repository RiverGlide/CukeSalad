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
    @result = @result + @display
    @display = @result
  end
end