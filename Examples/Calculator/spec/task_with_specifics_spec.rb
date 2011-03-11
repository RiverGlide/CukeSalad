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
    details.collect do | detail |
      OpenStruct.new Hash[*content_of( alternating_name_value_pairs_from( detail )) ]
    end
  end

  def content_of values
    values.collect { |e| e.gsub('\'', '').strip }
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
end
