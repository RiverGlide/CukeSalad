class Perform < TaskWithSpecifics

  def tokens
    value_of( :the_following ).split(" ")
  end

  def perform_as the_user
    operator = {"+" => :plus, "-" => :minus}
    tokens.each do | token |
      the_user.enters token.to_i if token =~ /\d+/
      the_user.presses operator[token] if operator.include? token
    end
  end
end
