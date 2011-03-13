$:.unshift(File.dirname(__FILE__), ".")
require 'spec_helper'

describe Actor do

  it "gets into character" do
    director = double("director")
    role_description = "description of the role"
    role = double( role_description )
    director.should_receive( :how_do_i_perform ).with( role_description ).and_return( role )
    
    actor = Actor.new role_description, director
  end  

  it "performs a simple task as that character" do
    director = double("director")
    role_description = "description of the role"
    role = double( role_description )
    director.should_receive( :how_do_i_perform ).with( role_description ).and_return( role )
    actor = Actor.new role_description, director
   
    task_description = "some description of a task"
    task = double( task_description )
    director.should_receive( :how_do_i_perform ).with( task_description ).and_return( task )
    task.should_receive( :perform_as ).with( role )

    actor.perform task_description
  end

  it "can perform a task that answers a question" do
    director = double("director")
    role_description = "description of the role"
    role = double( role_description )
    director.should_receive( :how_do_i_perform ).with( role_description ).and_return( role )
    actor = Actor.new role_description, director
   
    some_question = "some question to ask"
    the_answer = "the answer to the question"
    question = double( some_question )
    director.should_receive( :how_do_i_perform ).with( some_question ).and_return( question )
    question.should_receive( :perform_as ).with( role ).and_return( the_answer )

    actor.answer( some_question ).should == the_answer
  end

  it "can perform a task that requires certain details" do
    director = double("director")
    role_description = "description of the role"
    role = double( role_description )
    director.should_receive( :how_do_i_perform ).with( role_description ).and_return( role )
    actor = Actor.new role_description, director
    
    task_description = "some description of a task"
    details = "info it needs \"the info\"" 
    task = double( task_description )
    director.should_receive( :how_do_i_perform ).with( task_description, details ).and_return( task )
    task.should_receive( :perform_as ).with( role )

    actor.perform task_description, details
  end
end

