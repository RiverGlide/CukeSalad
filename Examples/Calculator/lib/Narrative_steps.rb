require 'ostruct'
require 'researcher'

class Actor
  def initialize role
    @director = Director.new
    @character = @director.how_do_i_perform role
  end
  
  def perform this_task, *with_these_details
    task = @director.how_do_i_perform this_task, *with_these_details
    task.perform_as @character
  end
  alias :answer :perform
end

class Director

  def how_do_i_perform this_thing, *these_details
    researcher = Researcher.new
    something = researcher.get_directives_for( this_thing )
    if details_required_for?(something) 
      something.new(*with_specifics_from(these_details))
    else
      something.new 
    end
  end
  alias :how_do_i_answer :how_do_i_perform

  def details_required_for? something
    something.instance_method(:initialize).arity > 0 
  end

  def with_specifics_from details
    specifics_pattern = /('[^']+')/
    details.collect do | detail |
      OpenStruct.new Hash[*detail.split(specifics_pattern).collect { |e| e.gsub('\'', '').strip.gsub(' ', '_') }]
    end
  end
end

Before do
    @sme = @sme ||= Director.new
end

Given /^I am a ([a-zA-Z ]+)$/ do |role|
  @actor = Actor.new(role)
end

When /^I (?:attempt to|was able to)? ([^']*)$/ do |this_task|
  @actor.perform this_task
end

When /^I (?:attempt to|was able to)? ([A-Z a-z_-]*): (.*)$/ do |this_task, with_these_details|
  @actor.perform this_task, with_these_details
end

Then /^I should ([^']*) '([^']*)'$/ do |this_question, expect_value|
  @actor.answer( this_question ).to_s.should == expect_value
end
