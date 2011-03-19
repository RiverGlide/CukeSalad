$:.unshift(File.dirname(__FILE__), ".")
require 'spec_helper'

class SomeTaskOrRole
end

class SomeTaskThatNeedsInformation
  attr_reader :information
  def initialize information
    @information = information
  end
end

describe Director do
  
  it "tells you how to perform something like a task or a role" do
    director = Director.new

    director.how_do_i_perform( "some task or role" ).should == SomeTaskOrRole
  end
end
