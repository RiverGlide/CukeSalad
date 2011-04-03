require 'codify/string'
class Director

  #TODO: the director needs to know the difference between a role and a task to give more appropriate feedback
  def how_do_i_perform something
    begin 
      find_directives_for something
    rescue NameError
      raise NameError, "I can't find a role called '#{ something.as_const_name }'. Have you created it?\ne.g.\n  module #{ something.as_const_name }\n  end"
    end
  end

  def find_directives_for something
    Kernel.const_get( something.as_const_name )
  end
end

