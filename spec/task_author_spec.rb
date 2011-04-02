$:.unshift(File.dirname(__FILE__), ".")
require 'spec_helper'
require 'task_author'

class SomeActor
  def see_how_to_do something
    extend something
  end
  def do_your_thing
    perform_task
  end
  def value_of thing
    "this is the info"
  end
end

describe 'TaskAuthor' do

  it "creates a module by the same name" do
    in_order_to "SomeTask" do;end

    SomeActor.new.see_how_to_do SomeTask
  end

  it "enables the actor to do something" do
    in_order_to "SomeOtherTask" do
      "done"
    end

    actor = SomeActor.new
    actor.see_how_to_do SomeOtherTask
    actor.do_your_thing.should == "done"
  end

  it "maps some attributes" do
    in_order_to "SomeOtherTask", with_info: :info do
      the :info
    end

    actor = SomeActor.new
    actor.see_how_to_do SomeOtherTask
    actor.do_your_thing.should == "this is the info"
  end
end
