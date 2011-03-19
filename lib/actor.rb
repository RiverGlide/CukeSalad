$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'bundler'
require 'director'
require 'specifics'
Bundler.setup

class Actor
  include Specifics

  def initialize this_type_of_role, directed_by=Director.new
    @director = directed_by
    get_ready_to_perform this_type_of_role
  end
  
  def perform described_task, *with_these_details
    get_ready_to_perform described_task
    details_required = with_these_details[0]
    understand_the details_required unless details_required.nil?
    perform_task 
  end
  alias :answer :perform

  def get_ready_to_perform something
    extend( @director.how_do_i_perform something )
  end
end
