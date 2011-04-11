$:.unshift(File.dirname(__FILE__), ".")
require 'spec_helper'
require 'codify/as_const_name'

describe Codify::ConstName do

  it "gives you ClassName from when it's already a class name" do
    Codify::ConstName.from( "ClassName" ).should == "ClassName"
  end

  it "gives you ClassName when separated by spaces" do
    Codify::ConstName.from( "Class Name" ).should == "ClassName"
  end

  it "gives you ClassName from lowercase class name" do
    Codify::ConstName.from( "class name" ).should == "ClassName"
  end

  it "gives you ClassName from lower case class name with leading/trailing spaces" do
    Codify::ConstName.from( " class name " ).should == "ClassName"
  end
  
  it "formats as a ClassName from a mix of class format and lower case" do
    Codify::ConstName.from( "AnotherClass name " ).should == "AnotherClassName"
  end
end

