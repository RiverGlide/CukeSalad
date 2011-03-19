$:.unshift(File.dirname(__FILE__), ".")
require 'spec_helper'

class Something
end
class Another
end
class MoreThanOneWord
end

describe Director do

  before :each do
    @director = Director.new
  end

  it "gives you directives (i.e. a class) for Something" do
    the_thing_we_found = @director.how_do_i_perform "something"
    the_thing_we_found.should == Something  
  end

  it "finds directives (i.e. a class) for something described with more than one word" do
    the_thing_we_found = @director.how_do_i_perform "more than one word"
    the_thing_we_found.should == MoreThanOneWord
  end

  it "apologises when it can't find what you asked for" do
    lambda { @director.how_do_i_perform "something that isnt there" }.should raise_error NameError
  end

end
