$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'bundler'
require 'ostruct'
Bundler.setup

class TaskWithSpecifics
  def initialize details
    @specifics = *specifics_from( details )
  end

  def specifics_from details
    details.collect do | detail |
      OpenStruct.new Hash[*content_of( alternating_name_value_pairs_from( detail )) ]
    end
  end

  def content_of values
    values.collect { |value| value.gsub('\'', '').strip.gsub(' ', '_') }
  end

  def alternating_name_value_pairs_from detail
    specifics_pattern = /('[^']+')/
    detail.split( specifics_pattern)
  end

end

class MyTask < TaskWithSpecifics
  attr_reader :specifics
end

describe TaskWithSpecifics do

  it "has an item of specific information" do
    task = MyTask.new "specific 'information'"
    task.specifics.specific.should == "information"
  end

  it "has items of specific information" do
    task = MyTask.new "first 'item' second 'another'"
    task.specifics.first.should == "item"
    task.specifics.second.should == "another"
  end

  it "should cope with names having more than one word" do
    task = MyTask.new "first thing 'item' second thing 'another'"
    task.specifics.first_thing.should == "item"
    task.specifics.second_thing.should == "another"
  end
end
