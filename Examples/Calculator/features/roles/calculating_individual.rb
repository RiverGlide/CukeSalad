require 'calculator'

class CalculatingIndividual

  def initialize
    @calculator = Calculator.new
  end

  def enters value
    @calculator.enter value.to_i
  end

  def presses button
    @calculator.send button
  end

  def can_see
    @calculator.display
  end
end
