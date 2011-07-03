require 'calculator'

module CalculatingIndividual

  def role_preparation
    switch_on_the_calculator
  end

  def switch_on_the_calculator
    @calculator = Calculator.new
    @operate_with = {
      plus: :+,
     minus: :-
    }
  end

  def enter value
    @calculator.enter value.to_i
  end

  def press next_operator
    if next_operator == :equals
      equals
    else
      @calculator.get_ready_to @operate_with[next_operator]
    end
  end

  def equals
    @calculator.equals
  end

  def look_at_the_display
    @calculator.display
  end
end
