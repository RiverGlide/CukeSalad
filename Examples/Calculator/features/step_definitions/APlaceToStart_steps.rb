class Calculator
  
  attr_reader :display
  
  def initialize
    @display = 0
  end
  
  def enter value
    @display = value
  end
end  

class CalculatingPerson
  def switch_on_the_calculator
      @calculator = Calculator.new
  end

  def enter value
    @calculator.enter value
  end  
  
  def see
    @calculator.display
  end
end

Given /^I was able to ([^"]*)$/ do |something|
  @calc = CalculatingPerson.new
  @calc.send(something.downcase.gsub(" ","_").to_sym)
end

When /^I attempt to ([^"]*)$/ do |something|
  @calc = CalculatingPerson.new
  @calc.send(something.downcase.gsub(" ","_").to_sym)
end

When /^I attempt to ([^"]*) "([^"]*)"$/ do |something,with_information|
  @calc.send(something.downcase.to_sym, with_information.to_i)
end

Then /^I should see it display "([^"]*)"$/ do |value|
  @calc.see.should == value.to_i
end