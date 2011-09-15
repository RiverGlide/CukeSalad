
class Calculator
 
  OPERATIONS = { 'plus' => '+', 'minus' => '-', 'equals' => '=' }
  OPERATORS = OPERATIONS.invert 

  attr_reader :display

  def initialize
    show 0
    @operands = []
  end
  
  def enter value
    show value
    @operands.push value
  end

  def get_ready_to op
    calculate_if_necessary
    start_next_calculation
    @operator = op
  end

  def equals
    we_need_two_operands
    deal_with_repeated_equals
    unless @operator.nil?
      show @operands.inject (@operator)
      @last_operator = @operator
      @operator = nil
      @operands[0] = @display
    end
  end

  private
  def show value
    @display = value
  end

  def calculate_if_necessary
    equals if @operands.size == 2
  end
  
  def start_next_calculation
    @operands = [@display] if @operator.nil?
  end

  def we_need_two_operands
    @operands.concat @operands if @operands.size == 1
  end
  
  def deal_with_repeated_equals
    @operator = @last_operator if @operands.size == 2 && @operator.nil? && @last_operator
  end
end
