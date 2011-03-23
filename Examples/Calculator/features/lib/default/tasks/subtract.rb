in_order_to "Subtract" do
  lets_say_we_want_to_subtract_two_numbers
  enter value_of( @first_number )
  press :minus
  enter value_of( @second_number )
  press :equals
end

def lets_say_we_want_to_subtract_two_numbers
  @first_number = :from_the_number
  @second_number = :the_number
end
