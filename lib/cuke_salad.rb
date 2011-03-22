$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'bundler'
require 'actor'
Bundler.setup

def in_order_to name, &block
  #TODO: Refactor out this eval. Temporary solution to get feedback on alternative style for tasks
  eval "module #{name}
  end"
  m = Kernel.const_get name
  m.send( :define_method, :perform_task, &block)
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
