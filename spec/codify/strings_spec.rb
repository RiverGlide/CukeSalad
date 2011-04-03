$:.unshift(File.dirname(__FILE__), ".")
require 'spec_helper'
require 'codify/string'

describe Codify::ClassName do

  it "gives you ClassName from variations of 'class name'" do
    "ClassName".as_class_name.should == "ClassName"
    "Class Name".as_class_name.should == "ClassName"
    "class name".as_class_name.should == "ClassName"
    " class name ".as_class_name.should == "ClassName"
  end

  it "gives you AnotherClassName from variations of 'another class name'" do
    "AnotherClassName".as_class_name.should == "AnotherClassName"
    "AnotherClass Name".as_class_name.should == "AnotherClassName"
    "Another Class Name".as_class_name.should == "AnotherClassName"
    "another class name".as_class_name.should == "AnotherClassName"
    " another class name ".as_class_name.should == "AnotherClassName"
  end
end

