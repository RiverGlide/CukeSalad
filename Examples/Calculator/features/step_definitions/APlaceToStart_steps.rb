class Calculator
  
  attr_reader :display
  
  def initialize
    @display = 0
  end
  
  def enter value
    @display = value
  end
  
end  

Given /^I was able to ([^"]*)$/ do |something|
  @calculator = Calculator.new
end

When /^I attempt to ([^"]*)$/ do |something|
  @calculator = Calculator.new
end

When /^I attempt to ([^"]*) "([^"]*)"$/ do |something,with_information|
  @calculator.send(something.downcase.to_sym, with_information.to_i)
end

Then /^I should see it display "([^"]*)"$/ do |arg1|
  @calculator.display.should == arg1.to_i
end