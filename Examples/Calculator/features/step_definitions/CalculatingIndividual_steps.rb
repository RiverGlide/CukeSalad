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

class Actor
  
  def initialize role
    @role = role.new
  end
  
  def perform task, with_information = nil
    if with_information.nil?
      @role.send method_for( task )
    else
      @role.send method_for( task ) , arguments_from( with_information )
    end
  end
  
  def method_for something
    something.downcase.gsub(" ","_").to_sym 
  end
  
  def arguments_from this_information
    this_information.gsub("'","").gsub("and","").split(" ")
  end
end

When /^I (?:attempt to|was able to)? ([^']*)$/ do |task|
  @actor = @actor ||= Actor.new(CalculatingIndividual)
  @actor.perform task
end

When /^I attempt to ([^']*) '(.*)'$/ do |task, with_information|
  @actor = @actor ||= Actor.new(CalculatingIndividual)
  @actor.perform task, with_information
end

Then /^I should ([^']*) '([^']*)'$/ do |question, expect_value|
  @actor.perform( question ).to_s.should == expect_value
end