$:.unshift(File.dirname(__FILE__), ".")
require 'spec_helper'
require 'codify/string'

describe Codify::AsConstName do

  it "gives you ClassName from when it's already a class name" do
    "ClassName".as_const_name.should == "ClassName"
  end

  it "gives you ClassName when separated by spaces" do
    "Class Name".as_const_name.should == "ClassName"
  end

  it "gives you ClassName from lowercase class name" do
    "class name".as_const_name.should == "ClassName"
  end

  it "gives you ClassName from lower case class name with leading/trailing spaces" do
    " class name ".as_const_name.should == "ClassName"
  end
  
  it "formats as a ClassName from a mix of class format and lower case" do
    "AnotherClass name ".as_const_name.should == "AnotherClassName"
  end
end

