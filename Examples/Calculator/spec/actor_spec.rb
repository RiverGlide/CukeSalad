$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'bundler'
Bundler.setup

class Director

end

class Actor

  def initialize role, director=Director.new
    @director = director
    @character = @director.how_do_i_perform role
  end
  
  def perform task_description
    task = @director.how_do_i_perform task_description
    task.perform_as @character
  end
end

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
    task.should_receive( :perform_as ).with( role )
    director.should_receive( :how_do_i_perform ).with( task_description ).and_return( task )

    actor.perform task_description
  end
end

