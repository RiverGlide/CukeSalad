require 'spec_helper'
require 'cukesalad/task_author'

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

module CukeSalad
  describe 'TaskAuthor' do
    include TaskAuthor

    it "creates a module by the same name" do
      in_order_to "SomeTask" do;end

      SomeActor.new.see_how_to_do SomeTask
    end

    it "creates a module by a similar name" do
      in_order_to "some different task" do;end

      SomeActor.new SomeDifferentTask
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
      in_order_to "YetAnotherTask", with_info: :info do
        the :info
      end

      actor = SomeActor.new
      actor.see_how_to_do YetAnotherTask
      actor.do_your_thing.should == "this is the info"
    end
  end
end
