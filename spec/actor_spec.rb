$:.unshift(File.dirname(__FILE__), ".")
require 'spec_helper'

module SetThePlaceAtTheTable

  def perform_task
    place = []
    place_the_fork_on_the_left_of place
    place_the_knife_on_the_right_of place
    place
  end
end

module LayTheTable
 
  def perform_task
    value_of( :with_places_for ).to_i
  end
end

module Butler

  def place_the_fork_on_the_left_of place
    place.unshift "fork"
  end

  def place_the_knife_on_the_right_of place
    place.push "knife"
  end

end

describe Actor do

  it "gets into character" do
    director = double("director")
    role_description = "Butler"
    director.should_receive( :explain_the_role ).with( role_description ).and_return( Butler )
    
    actor = Actor.new role_description, director
  end  

  it "performs a simple task as that character" do
    role_description = "Butler"
   
    task_description = "set the place at the table"
    
    director = double("director")
    director.should_receive( :explain_the_role ).with( role_description ).and_return( Butler )
    director.should_receive( :how_do_i_perform ).with( task_description ).and_return( SetThePlaceAtTheTable )
   
    actor = Actor.new role_description, director
    
    actor.perform(task_description).should == ["fork","knife"]
  end

  it "can perform a task that requires certain details" do
    role_description = "Butler"
    
    task_description = "Lay The Table"
    details = { with_places_for: '5' }

    director = double("director")
    director.should_receive( :explain_the_role ).with( role_description ).and_return( Butler )
    director.should_receive( :how_do_i_perform ).with( task_description ).and_return( LayTheTable )

    actor = Actor.new role_description, director

    actor.perform( task_description, details ).should == 5
  end
end

