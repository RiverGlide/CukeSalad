in_order_to "Add" do
    lets_say_we_have_two_numbers
    enter value_of( @first_number )
    press :plus
    enter value_of( @second_number )
    press :equals
end

def lets_say_we_have_two_numbers
  @first_number = :the_number
  @second_number = :to_the_number
end
