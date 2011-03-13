require 'calculator'

class CalculatingIndividual

  def initialize
    @calculator = Calculator.new
  end

  def enter value
    @calculator.enter value
  end

  def press button
    @calculator.send button
  end

  def what_can_you_see
    @calculator.display
  end
end
