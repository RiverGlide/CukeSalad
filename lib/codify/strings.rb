module Codify
  module Codify::ClassName
    def as_class_name
      joined_together capitalised( words_from self )
    end
    
    private
    def joined_together words
      words.join
    end
    
    def words_from this_sentence
      /\s|([A-Z][a-z]+)/
      this_sentence.split(/\s|([A-Z][a-z]+)/)
    end

    def capitalised words
      words.collect{ | word | word.capitalize }
    end
  end
end
