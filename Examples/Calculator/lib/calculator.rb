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

  def equals
    # All our examples require us to do so far is addition
    # Another user-story for subtraction will cause this method to change
    plus
  end
end
