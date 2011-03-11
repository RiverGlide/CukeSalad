$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'bundler'
Bundler.setup

class Director

end

class Actor

  def initialize role, director=Director.new
    director.how_do_i_perform role
  end

end

describe Actor do

  it "finds out how to perform a role" do
    director = double("director")
    role = "description of the role"
    director.should_receive( :how_do_i_perform ).with( role )
    
    actor = Actor.new role, director
  end  

end

