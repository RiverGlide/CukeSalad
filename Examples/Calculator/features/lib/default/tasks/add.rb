module Add

  def follow_instructions
    lets_say_you_want_to_add_two_numbers
    enter @first_number
    press :plus
    enter @second_number
    press :equals
  end

  def lets_say_you_want_to_add_two_numbers
    @first_number = value_of :the_number
    @second_number = value_of :to_the_number
  end
end
