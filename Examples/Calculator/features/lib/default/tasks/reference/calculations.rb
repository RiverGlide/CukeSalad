require 'calculator_operations'

module Calculations
  
  def follow_the_steps_for sum
    enter_numbers_and_operators_for sum
  end
  
  def enter_numbers_and_operators_for sum
    operators = CalculatorOperations::OPERATORS
    sum.each do | token |
      enter token.to_i if token =~ /\d+/
      press operators[token].to_sym if operators.include? token
    end
  end
end

