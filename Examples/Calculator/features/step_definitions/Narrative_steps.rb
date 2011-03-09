$:.unshift(File.dirname(__FILE__) + '/../../lib')
$:.unshift(File.dirname(__FILE__) + '/../tasks')

require 'calculating_individual' #TODO: remove the need for require so that the Narrative_steps can come from a gem
require 'ostruct'

class Actor
  def initialize role
    @character = role.new
  end
  
  def perform task
    task.perform_as @character
  end
  alias :answer :perform
end

class Librarian
  def class_for this_thing
    begin
      Kernel.const_get( class_name_from this_thing) ##TODO: Do we need a better solution? Maybe ActiveSupport constantize
    rescue NameError => exception
      raise "The Librarian couldn't find the '#{class_name_from this_thing}' task.\nMaybe you need to create it."  # TODO: Create a LibarianApology class? Or re-raise and rescue in SME?
    end
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
  
  def how_do_i_perform this_task, these_details =nil #TODO: must get rid of nil
    task = Librarian.new.class_for( this_task )
    if these_details == nil
      task.new
    else
      task.new with_arguments_from( these_details )
    end
  end
  alias :how_do_i_answer :how_do_i_perform
    
  def method_for something
    something.downcase.gsub(" ","_").to_sym 
  end
  
  def with_arguments_from details
    argument_pattern = /('[^']+')/
    OpenStruct.new Hash[*details.split(argument_pattern).collect { |e| e.gsub('\'', '').strip.gsub(' ', '_') }]
  end
end

Before do
    @sme = @sme ||= SubjectMatterExpert.new
end

Given /^I am a ([a-zA-Z ]+)$/ do |role|
  @actor = Actor.new(Librarian.new.class_for role)
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
