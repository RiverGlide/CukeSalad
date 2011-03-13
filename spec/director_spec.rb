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

    director.how_do_i_perform( "some task or role" ).should be_instance_of SomeTaskOrRole
  end

  it "tells you how to do something with additional information" do
    director = Director.new

    task = director.how_do_i_perform( "some task that needs information" , "detail1 'detail one' detail2 'detail 2'" )
    task.should be_instance_of SomeTaskThatNeedsInformation
  end

  it "complains when you try to perform a task that needs information, but don't supply it" do
    director = Director.new

    lambda { director.how_do_i_perform( "some task that needs information") }.should raise_error INeedMoreInformationComplaint
  end

  it "complains when you try to perform a task that doesn't want information, but you try and give it some" do
    director = Director.new

    lambda { director.how_do_i_perform( "some task or role", "with 'extra information'" ) }.should raise_error TooMuchInformationComplaint
  end
end
