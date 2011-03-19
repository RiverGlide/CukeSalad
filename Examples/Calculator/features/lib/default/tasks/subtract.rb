module Subtract

  def perform_task
    lets_say_you_want_the_difference_between_two_numbers
    enter @the_first_number
    press :minus
    enter @the_second_number
    press :equals
  end

  def lets_say_you_want_the_difference_between_two_numbers
    @the_first_number = value_of( :from_the_number)
    @the_second_number = value_of( :the_number )
  end
end
