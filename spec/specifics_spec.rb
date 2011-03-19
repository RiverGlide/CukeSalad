$:.unshift(File.dirname(__FILE__), ".")
require 'spec_helper'

class NeedingSpecifics
  include Specifics
end

describe Specifics do

  it "has an item of specific information" do
    something = NeedingSpecifics.new
    something.understand_the "specific 'information'"
    something.value_of(:specific).should == "information"
  end

  it "has items of specific information" do
    something = NeedingSpecifics.new
    something.understand_the "first 'item' second 'another'"
    something.value_of(:first).should == "item"
    something.value_of(:second).should == "another"
  end

  it "copes with names having more than one word" do
    something = NeedingSpecifics.new 
    something.understand_the "first thing 'item' second thing 'another'"
    something.value_of(:first_thing).should == "item"
    something.value_of(:second_thing).should == "another"
  end
  
  it "should cope with values having more than one word" do
    something = NeedingSpecifics.new
    something.understand_the "first thing 'item' second thing 'another thing'"
    something.value_of(:first_thing).should == "item"
    something.value_of(:second_thing).should == "another thing"
  end
end
