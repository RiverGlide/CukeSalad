class Researcher
  def get_directives_for something
    begin 
      find_directives_for something
    rescue NameError
      raise "I can't find a class called '#{class_name_from something}'.\nMaybe you need to create it."
    end
  end

  def find_directives_for something
    Kernel.const_get( class_name_from something )
  end

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

