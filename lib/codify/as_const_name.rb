module Codify
  module Codify::AsConstName
    def as_const_name
      joined_together capitalised( words_from self )
    end
    
    private
    def joined_together words
      words.join
    end
    
    def words_from this_sentence
      on_word_boundary = /\s|([A-Z][a-z]+)/
      this_sentence.split( on_word_boundary )
    end

    def capitalised words
      words.collect{ | word | word.capitalize }
    end
  end
end
