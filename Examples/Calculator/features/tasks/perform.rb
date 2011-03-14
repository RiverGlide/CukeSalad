class Perform < TaskWithSpecifics

  def tokens
    value_of( :the_calculation ).split(" ")
  end

  def perform_as the_user
    using_operator = {"+" => :plus, "-" => :minus}
    tokens.each do | token |
      the_user.enters token.to_i if token =~ /\d+/
      the_user.presses using_operator[token] if using_operator.include? token
    end
  end
end
