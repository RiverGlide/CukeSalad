$:.unshift(File.dirname(__FILE__), ".")
require 'spec_helper'
require 'codify/as_const_name'

describe Codify::ConstName do
  include Codify
  
  it "gives you ClassName from when it's already a class name" do
    ConstName.from( "ClassName" ).should == "ClassName"
  end

  it "gives you ClassName when separated by spaces" do
    ConstName.from( "Class Name" ).should == "ClassName"
  end

  it "gives you ClassName from lowercase class name" do
    ConstName.from( "class name" ).should == "ClassName"
  end

  it "gives you ClassName from lower case class name with leading/trailing spaces" do
    ConstName.from( " class name " ).should == "ClassName"
  end
  
  it "formats as a ClassName from a mix of class format and lower case" do
    ConstName.from( "AnotherClass name " ).should == "AnotherClassName"
  end
end

