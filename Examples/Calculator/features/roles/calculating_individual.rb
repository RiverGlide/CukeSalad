require 'calculator'

class CalculatingIndividual

  def initialize
    @calculator = Calculator.new
  end

  def enters value
    @calculator.enter value.to_i
  end

  def presses next_operator
    @calculator.get_ready_to next_operator
  end

  def can_see
    @calculator.display
  end
end
