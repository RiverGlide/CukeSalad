require 'cukesalad'

def in_order_to(do_something, *with_attributes, &actions)
 CukeSalad::TaskAuthor.in_order_to(do_something, *with_attributes, &actions)
end

World(CukeSalad::TaskAuthor)
World(CukeSalad::Specifics)

When /^I say hello CukeSalad$/ do
  puts "CukeSalad says: Hello!!"
end

Given /^(?:I am|you are) a ([a-zA-Z ]+)$/ do |role|
  @actor = CukeSalad::Actor.new(role)
end

When /^(?:I|you) (?:attempt to|was able to|were able to|did)? ([A-Z a-z_-]*)(?:[:|,] (.*))?:?$/ do | this_task, details, *and_more |
  info = understand_the details unless details.nil?
  info[info.keys.last] = and_more[0] unless and_more.empty?
  @actor.perform this_task, info unless info.nil?
  @actor.perform this_task if info.nil?
end

Then /^(?:I|you) should ([^':]*)(?: '([^']*)')$/ do | this_question, expect_value |
  @actor.answer( this_question ).to_s.should == expect_value
end

Then /^(?:I|you) should ([^':]+)$/ do | this_question |
  @actor.answer( this_question )
end

Then /^(?:I|you) should ([^']*) that includes:$/ do | this_question, expected_content |
  @actor.answer( this_question ).should include( expected_content )
end
