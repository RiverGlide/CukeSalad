$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'bundler'
require 'actor'
Bundler.setup

def in_order_to name, *map, &block
  attr_map = map[0]
  m = Module.new do
    define_method :perform_task, &block
    define_method :the do | value |
      value_of( attr_map.key value )
    end
  end
  Kernel.const_set(name, m)
end

Given /^(?:I am|you are) a ([a-zA-Z ]+)$/ do |role|
  @actor = Actor.new(role)
end

When /^(?:I|you) (?:attempt to|was able to|were able to|did)? ([A-Z a-z_-]*)(?:: (.*))?$/ do |this_task, with_these_details, *new_line_string|
  details = ""
  details <<  with_these_details unless with_these_details.nil?
  details << " '#{new_line_string[0]}'" unless new_line_string.empty?
  @actor.perform this_task, details unless with_these_details.nil?
  @actor.perform this_task if with_these_details.nil?
end

Then /^(?:I|you) should ([^']*)(?: '([^']*)')?$/ do |this_question, expect_value, *new_line_string|
  expect_value ||= ""
  expect_value << new_line_string[0] unless new_line_string.empty?
  @actor.answer( this_question ).to_s.should == expect_value
end
