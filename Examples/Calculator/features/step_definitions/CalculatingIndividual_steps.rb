class Calculator
  
  attr_reader :display
  
  def initialize
    @display = 0
    @result = 0
  end
  
  def enter value
    @display = value
  end
  
  def plus
    @result = @result + @display
    @display = @result
  end
  
end  

class CalculatingIndividual
  def switch_on_the_calculator
      @calculator = Calculator.new
  end

  def add_the_numbers from_list
    from_list.each do |value|
      @calculator.enter value.to_f
      @calculator.plus
    end
  end
  
  def get_the_answer
    @calculator.display
  end
end

def method_for something
  something.downcase.gsub(" ","_").to_sym 
end

def arguments_from this_information
  this_information.gsub("'","").gsub("and","").split(" ")
end

When /^I (?:attempt to|was able to)? ([^']*)$/ do |something|
  @actor = @actor ||= CalculatingIndividual.new
  @actor.send method_for( something )
end

When /^I attempt to ([^']*) '(.*)'$/ do |something, with_information|
  @actor = @actor ||= CalculatingIndividual.new
  @actor.send method_for (something), arguments_from (with_information)
end

Then /^I should ([^']*) '([^']*)'$/ do |something, expect_value|
  @actor.send(method_for(something)).to_s.should == expect_value
end