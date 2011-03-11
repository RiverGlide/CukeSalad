require 'ostruct'
require 'librarian'

class Actor
  def initialize role
    @character = role.new
  end
  
  def perform task
    task.perform_as @character
  end
  alias :answer :perform
end

class SubjectMatterExpert
  include Librarian  
  def how_do_i_perform this_task, *these_details 
    task = class_for( this_task )
    if task_requires_details?(task) 
      task.new(*with_arguments_from(these_details))
    else
      task.new 
    end
  end
  alias :how_do_i_answer :how_do_i_perform
    
  def task_requires_details? task
    task.instance_method(:initialize).arity > 0 
  end

  def with_arguments_from details
    argument_pattern = /('[^']+')/
    details.collect do |detail|
      OpenStruct.new Hash[*detail.split(argument_pattern).collect { |e| e.gsub('\'', '').strip.gsub(' ', '_') }]
    end
  end
end

Before do
    @sme = @sme ||= SubjectMatterExpert.new
end

Given /^I am a ([a-zA-Z ]+)$/ do |role|
  @actor = Actor.new(@sme.class_for role)
end

When /^I (?:attempt to|was able to)? ([^']*)$/ do |this_task|
  task = @sme.how_do_i_perform this_task
  @actor.perform task
end

When /^I (?:attempt to|was able to)? ([A-Z a-z_-]*): (.*)$/ do |this_task, with_these_details|
  task = @sme.how_do_i_perform this_task, with_these_details
  @actor.perform task
end

Then /^I should ([^']*) '([^']*)'$/ do |this_question, expect_value|
  question = @sme.how_do_i_answer this_question
  @actor.answer( question ).to_s.should == expect_value
end
