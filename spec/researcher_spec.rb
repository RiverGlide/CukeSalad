$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'bundler'
require 'researcher'
Bundler.setup

class Something
end
class Another
end
class MoreThanOneWord
end

describe Researcher do

  before :each do
    @researcher = Researcher.new
  end

  it "gives you directives (i.e. a class) for Something" do
    the_thing_we_found = @researcher.get_directives_for "Something"
    the_thing_we_found.should == Something  
  end

  it "finds directives (i.e. a class) for something described with more than one word" do
    the_thing_we_found = @researcher.get_directives_for "more than one word"
    the_thing_we_found.should == MoreThanOneWord
  end

  it "apologises when it can't find what you asked for" do
    lambda { @researcher.get_directives_for "something that isnt there" }.should raise_error RuntimeError, "I can't find a class called 'SomethingThatIsntThere'.\nMaybe you need to create it."
  end

end
