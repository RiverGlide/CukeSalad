$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'bundler'
require 'expert'
Bundler.setup

class Something
end
class Another
end
class MoreThanOneWord
end

class Someone
  include Expert
end
  
describe "Something" do

  before :each do
    @someone = Someone.new
  end

  it "finds a class for a thing" do
    the_thing_we_found = @someone.class_for "Something"
    the_thing_we_found.should == Something  
  end

  it "finds a class for another" do
    the_thing_we_found = @someone.class_for "Another"
    the_thing_we_found.should == Another
  end

  it "finds a class with more than one word" do
    the_thing_we_found = @someone.class_for "more than one word"
    the_thing_we_found.should == MoreThanOneWord
  end

  it "complains when it encounters a name error" do
    lambda { @someone.class_for "something that isnt there" }.should raise_error RuntimeError, "I couldn't find the class 'SomethingThatIsntThere'.\nMaybe you need to create it."
  end

end
