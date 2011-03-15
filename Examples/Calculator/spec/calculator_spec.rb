$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'bundler'
Bundler.setup
require 'calculator'

describe Calculator do

  it "starts with zero" do
    calc = Calculator.new

    calc.display.should == 0
  end

  it "shows the current number" do
    calc = Calculator.new
    calc.enter 1

    calc.display.should == 1
  end

  it "displays the same when equals alone is pressed" do
    calc = Calculator.new
    calc.enter 1

    calc.equals

    calc.display.should == 1
  end

  it "treats 1 + = like 1 + 1 =" do
    calc = Calculator.new

    calc.enter 1
    calc.get_ready_to :+
    calc.equals

    calc.display.should == 2
  end

  it "repeats the last operation" do
    calc = Calculator.new
    calc.enter 1
    calc.get_ready_to :+
    calc.equals
    calc.equals
    calc.display.should == 3
  end

  it "starts again when you enter a number after equals" do
    calc = Calculator.new
    calc.enter 1
    calc.get_ready_to :+
    calc.enter 1
    calc.equals
    calc.enter 5
    calc.get_ready_to :+
    calc.equals
    
    calc.display.should == 10
  end

  it "calculate what it has so far" do
    calc = Calculator.new
    calc.enter 1
    calc.get_ready_to :+
    calc.enter 1
    calc.get_ready_to :+ 

    calc.display.should == 2
  end

end
