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
  
  def perform task
    if task.information != nil
      @role.send task.name, task.information
    else
      @role.send task.name
    end
  end
  alias :answer :perform
end

class Task
  attr_reader :name, :information
  
  def initialize name, information = nil
    @name=name
    @information = information
  end
end

class SubjectMatterExpert
  
  def how_do_i_perform this_task, with_information =nil
    if with_information != nil
      Task.new method_for( this_task ), arguments_from( with_information )
    else
      Task.new method_for( this_task )
    end
  end
  alias :how_do_i_answer :how_do_i_perform
  
  def method_for something
    something.downcase.gsub(" ","_").to_sym 
  end
  
  def arguments_from this_information
    this_information.gsub("'","").gsub("and","").split(" ")
  end
end

When /^I (?:attempt to|was able to)? ([^']*)$/ do |this_task|
  @actor = @actor ||= Actor.new(CalculatingIndividual)
  @sme = @sme ||= SubjectMatterExpert.new
  task = @sme.how_do_i_perform this_task
  @actor.perform task
end

When /^I attempt to ([^']*) '(.*)'$/ do |this_task, with_information|
  @actor = @actor ||= Actor.new(CalculatingIndividual)
  @sme = @sme ||= SubjectMatterExpert.new
  task = @sme.how_do_i_perform this_task, with_information
  @actor.perform task
end

Then /^I should ([^']*) '([^']*)'$/ do |this_question, expect_value|
  @actor = @actor ||= Actor.new(CalculatingIndividual)
  @sme = @sme ||= SubjectMatterExpert.new
  question = @sme.how_do_i_answer this_question
  @actor.answer( question ).to_s.should == expect_value
end