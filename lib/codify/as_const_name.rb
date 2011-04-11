module Codify
  module ConstName
    def ConstName.from sentence
      joined_together capitalised( words_from sentence )
    end
    
    private
    def ConstName.joined_together words
      words.join
    end
    
    def ConstName.words_from this_sentence
      on_word_boundary = /\s|([A-Z][a-z]+)/
      this_sentence.split( on_word_boundary )
    end

    def ConstName.capitalised words
      words.collect{ | word | word.capitalize }
    end
  end
end
