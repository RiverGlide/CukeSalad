require 'rubygems'
require 'rspec/expectations'

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

class Actor
  
  def initialize role
    @character = role.new
  end
  
  def perform task
    task.perform_as @character
  end
  alias :answer :perform
end

class SwitchOnTheCalculator 
  include RSpec::Matchers
  
  def initialize with_nothing
  end
  
  def perform_as calculator
      calculator.should_not be_nil
  end
end

class AddTheNumbers
  def initialize from_list
    @from_list = from_list
  end
  
  def perform_as calculator
    @from_list.each do |value|
      calculator.enter value.to_f
      calculator.plus
    end
  end
end

class GetTheAnswer 
  def initialize with_nothing
  end
  def perform_as calculator
    calculator.display
  end
end

class Librarian
  def class_for this_thing
    Kernel.const_get( class_name_from this_thing) # need a better solution - like ActiveSupport constantize
  end

  def class_name_from this_sentence
    class_name = ""
    this_sentence.downcase.split(" ").each do |word|
      class_name = class_name + word.capitalize
    end
    class_name
  end
end

class SubjectMatterExpert
  
  def how_do_i_perform this_task, with_information =nil
    Librarian.new.class_for( this_task ).new arguments_from( with_information )
  end
  alias :how_do_i_answer :how_do_i_perform
    
  def method_for something
    something.downcase.gsub(" ","_").to_sym 
  end
  
  def arguments_from this_information
    this_information.gsub("'","").gsub("and","").split(" ") unless this_information == nil
  end
end

Before do
    @sme = @sme ||= SubjectMatterExpert.new
end

Given /^I have a (\w+)$/ do |thing|
  @actor = Actor.new(Librarian.new.class_for thing)
end

When /^I (?:attempt to|was able to)? ([^']*)$/ do |this_task|
  task = @sme.how_do_i_perform this_task
  @actor.perform task
end

When /^I (?:attempt to|was able to)? ([^']*) '(.*)'$/ do |this_task, with_information|
  task = @sme.how_do_i_perform this_task, with_information
  @actor.perform task
end

Then /^I should ([^']*) '([^']*)'$/ do |this_question, expect_value|
  question = @sme.how_do_i_answer this_question
  @actor.answer( question ).to_s.should == expect_value
end