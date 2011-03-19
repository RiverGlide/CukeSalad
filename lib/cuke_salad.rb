$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'bundler'
require 'actor'
Bundler.setup

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
