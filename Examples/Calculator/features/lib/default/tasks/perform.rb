module Perform

  def tokens
    value_of( :the_following ).split(" ")
  end

  def follow_instructions
    operator = {"+" => :plus, "-" => :minus, "=" => :equals}
    tokens.each do | token |
      enters token.to_i if token =~ /\d+/
      presses operator[token] if operator.include? token
    end
  end
end
