require 'calculator'

class CalculatingIndividual

  def initialize
    @calculator = Calculator.new
  end

  def enters value
    @calculator.enter value.to_i
  end

  def presses button
    @calculator.get_ready_to button
  end

  def can_see
    @calculator.display
  end
end
