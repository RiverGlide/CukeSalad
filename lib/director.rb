require 'codify/as_const_name'
class Director

  include Codify
  #TODO: the director needs to know the difference between a role and a task to give more appropriate feedback
  def how_do_i_perform something
    name = ConstName.from something
    begin 
      find_directives_for name
    rescue NameError
      raise NameError, "I can't find a role called '#{ name }'. Have you created it?\ne.g.\n  module #{ name }\n  end"
    end
  end

  def find_directives_for something
    Kernel.const_get( something )
  end
end

