module Researcher
  def class_for something
    begin 
      Kernel.const_get( class_name_from something )
    rescue NameError
      raise "I couldn't find the class '#{class_name_from something}'.\nMaybe you need to create it."
    end
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

