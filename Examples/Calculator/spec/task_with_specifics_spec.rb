$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'bundler'
require 'ostruct'
Bundler.setup

class TaskWithSpecifics
  def initialize details
    @specifics = *specifics_from( details )
    @specifics.specific.should == "information"
  end

  def specifics_from details
    specifics_pattern = /('[^']+')/
    details.collect do | detail |
      OpenStruct.new Hash[*detail.split( specifics_pattern ).collect { |e| e.gsub('\'', '').strip }]
    end
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
end
