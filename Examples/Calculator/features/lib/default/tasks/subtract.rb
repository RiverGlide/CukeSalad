module Subtract

  def follow_instructions
    you_need_two_numbers
    enter @the_first_number
    press :minus
    enter @the_second_number
  end

  def you_need_two_numbers
    @the_first_number = value_of( :from_the_number)
    @the_second_number = value_of( :the_number )
  end
end
