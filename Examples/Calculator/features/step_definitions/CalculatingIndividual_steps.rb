class Calculator
  
  attr_reader :display
  
  def initialize
    @display = 0
  end
  
  def enter value
    @display = value
  end
end  

class CalculatingIndividual
  def switch_on_the_calculator
      @calculator = Calculator.new
  end

  def enter value
    @calculator.enter value
  end  
  
  def see_it_display
    @calculator.display
  end
end

When /^I (?:was able to|attempt to)? ([^"]*)$/ do |something|
  @person = @person || CalculatingIndividual.new
  @person.send(something.downcase.gsub(" ","_").to_sym)
end

When /^I attempt to ([^"]*) "([^"]*)"$/ do |something, with_information|
  @person.send something.downcase.to_sym, with_information.to_i
end

Then /^I should ([^"]*) "([^"]*)"$/ do |something, expect_value|
  @person.send(something.downcase.gsub(" ","_").to_sym).should == expect_value.to_i
end