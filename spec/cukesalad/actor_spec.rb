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

module CukeSalad
  describe Actor do

    it "gets into character" do
      role_description = "Butler"
      director = double("director")
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

    it "can take note of information" do
      role_description = "Butler"
      
      director = double("director")
      director.should_receive( :explain_the_role ).with( role_description ).and_return( Butler )

      actor = Actor.new role_description, director

      actor.take_note_of :something, "of importance"
      actor.recall( :something ).should == "of importance"
    end

    it "tells you when it can't find the information you're looking for" do
      role_description = "Butler"
      
      director = double("director")
      director.should_receive( :explain_the_role ).with( role_description ).and_return( Butler )

      actor = Actor.new role_description, director

      lambda {actor.recall( :something )}.should raise_error KeyError, 
        "You tried to recall ':something' but no previous step appears to have taken note of that information."
    end
  end
end
