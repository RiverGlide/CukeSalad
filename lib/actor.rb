require 'specifics'
require 'director'

class Actor
  include Specifics

  def initialize this_type_of_role, directed_by=Director.new
    @director = directed_by
    get_ready_to_perform this_type_of_role
  end
  
  def perform described_task, *details
    get_ready_to_perform described_task
    understand_the *details unless details.empty?
    perform_task 
  end
  alias :answer :perform

  def get_ready_to_perform something
    extend( @director.how_do_i_perform something )
  end
end
