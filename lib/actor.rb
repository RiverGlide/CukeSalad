$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'bundler'
require 'director'
require 'specifics'
Bundler.setup

class Actor
  include Specifics

  def initialize role, director=Director.new
    @director = director
    extend( @director.how_do_i_perform role )
  end
  
  def perform task_description, *with_these_details
    extend( @director.how_do_i_perform task_description )
    details_required = with_these_details[0]
    understand_the details_required unless details_required.nil?
    follow_instructions 
  end
  alias :answer :perform
end
