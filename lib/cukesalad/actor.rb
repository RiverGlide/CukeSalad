require 'cukesalad/director'

module CukeSalad
  class Actor
     
    def initialize this_type_of_role, directed_by=Director.new
      @director = directed_by
      @note_pad = {}
      get_into_character_for this_type_of_role
    end
    
    def perform described_task, details = {}
      get_ready_to_perform described_task
      @info = details
      perform_task 
    end
    alias :answer :perform

    def get_into_character_for described_role
      the_role = @director.explain_the_role described_role
      see_how_to_do the_role
    end
    
    def get_ready_to_perform something
      the_thing = @director.how_do_i_perform something
      see_how_to_do the_thing 
    end

    def see_how_to_do something
      extend something
      role_preparation
    end

    def role_preparation
      # Does nothing unless you override it from your role
    end

    def value_of(symbol)
      @info[symbol]
    end

    def take_note_of key, value
     @note_pad.store key, value
    end

    def recall key
      begin
        @note_pad.fetch key
      rescue KeyError
        raise KeyError, "You tried to recall ':#{key}' but no previous step appears to have taken note of that information."
      end
    end
  end
end
