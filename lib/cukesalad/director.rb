require 'cukesalad/codify/const_name'
class Director

  include Codify
 
  #TODO: Needs refactoring 
  def explain_the_role description
    name = ConstName.from description
    begin
      find_directives_for name
    rescue NameError
      raise "I can't find a role called '#{ name }'. Have you created it?\ne.g.\n  module #{ name }\n  end"
    end
  end

  def how_do_i_perform something
    name = ConstName.from something
    begin
      find_directives_for name
    rescue NameError
      raise "I can't find a task called '#{ something }'. Have you created it?\ne.g.\n  in_order_to '#{ something }' do\n    # the actions\n  end" 
    end
  end

  def find_directives_for something
    Kernel.const_get( something )
  end
end
