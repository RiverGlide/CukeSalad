
class Calculator
 
  attr_reader :display

  def initialize
    @display = 0
    @operands = []
  end
  
  def enter value
    @display = value
    @operands.push value
  end

  def get_ready_to op
    equals if @operands.size == 2
    @operands = [@display] if @operator.nil?
    @operator = op
  end

  def equals
    if @operands.size == 1
      @operands.concat @operands
    end
    if @operands.size == 2 && @operator.nil? && @last_operator
      @operator = @last_operator
    end
    unless @operator.nil?
      @display = @operands.inject (@operator)
      @last_operator = @operator
      @operator = nil
      @operands[0] = @display
    end
  end
  
end
