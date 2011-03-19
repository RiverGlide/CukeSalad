module Add

  def we_need_two_numbers_to_add
    @first_number = value_of :the_number
    @second_number = value_of :to_the_number
  end

  def follow_instructions
    we_need_two_numbers_to_add
    enter @first_number
    press :plus
    enter @second_number
  end
end
