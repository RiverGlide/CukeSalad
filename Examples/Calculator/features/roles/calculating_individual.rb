require 'calculator'

class CalculatingIndividual

  def initialize
    @calculator = Calculator.new
    @operate_with = {
      plus: :+,
     minus: :-
    }
  end

  def enters value
    @calculator.enter value.to_i
  end

  def presses next_operator
    if next_operator == :equals
      equals
    else
      @calculator.get_ready_to @operate_with[next_operator]
    end
  end

  def equals
    @calculator.equals
  end

  def can_see
    @calculator.display
  end
end
