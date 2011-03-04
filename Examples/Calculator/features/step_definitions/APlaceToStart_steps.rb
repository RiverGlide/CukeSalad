class Calculator
  
  def display
    0
  end
  
end  

When /^I switch on the calculator$/ do
  @calculator = Calculator.new
end
  
Then "I should see it display 0" do
  @calculator.display.should == 0
end
  
