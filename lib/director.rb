class Director

  #TODO: the director needs to know the difference between a role and a task to give more appropriate feedback
  def how_do_i_perform something
    begin 
      find_directives_for something
    rescue NameError
      raise NameError, "I can't find a role called '#{class_name_from something}'. Have you created it?\ne.g.\n  module #{class_name_from something}\n  end"
    end
  end

  def find_directives_for something
    Kernel.const_get( class_name_from something )
  end
#TODO: all these methods need to go somewhere else - I'm thinking Codify::ClassName
  def class_name_from this_sentence
    joined_together capitalised( words_from this_sentence )
  end
  
  def joined_together words
    words.join
  end

  def words_from sentence
   sentence.split(" ")
  end

  def capitalised words
    words.collect { |word | word.capitalize }
  end
end

