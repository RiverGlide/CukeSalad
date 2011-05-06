require 'spec_helper'

class NeedingSpecifics
  include CukeSalad::Specifics
end

module CukeSalad
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

    context 'the last item' do
      it "can be empty" do
        something = NeedingSpecifics.new
        something.understand_the "containing"
        something.value_of(:containing).should be_nil
      end

      it "can be the only item and have a value assigned" do
        something = NeedingSpecifics.new
        something.understand_the "containing"
        something.set_last('some value')
        something.value_of(:containing).should == 'some value'
      end

      it "can be the only item and be empty" do
        something = NeedingSpecifics.new
        something.understand_the "called 'something' containing"
        something.value_of(:called).should == 'something'
        something.value_of(:containing).should be_nil
      end

      it "can have a value assigned" do
        something = NeedingSpecifics.new
        something.understand_the "called 'something' containing"
        something.value_of(:called).should == 'something'
        something.set_last('some value')
        something.value_of(:containing).should == 'some value'
      end

    end
  end
end
