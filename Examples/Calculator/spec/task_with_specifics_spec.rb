$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'bundler'
require 'task_with_specifics'
Bundler.setup

class MyTask < TaskWithSpecifics
  attr_reader :value_of
end

describe TaskWithSpecifics do

  it "has an item of specific information" do
    task = MyTask.new "specific 'information'"
    task.value_of.specific.should == "information"
  end

  it "has items of specific information" do
    task = MyTask.new "first 'item' second 'another'"
    task.value_of.first.should == "item"
    task.value_of.second.should == "another"
  end

  it "copes with names having more than one word" do
    task = MyTask.new "first thing 'item' second thing 'another'"
    task.value_of.first_thing.should == "item"
    task.value_of.second_thing.should == "another"
  end
  
  it "should cope with values having more than one word" do
    pending "Underscores should not be added to values with more than one word"
    task = MyTask.new "first thing 'item' second thing 'another thing'"
    task.value_of.first_thing.should == "item"
    task.value_of.second_thing.should == "another thing"
  end
  
end
