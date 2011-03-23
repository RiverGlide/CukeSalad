in_order_to "Add", the_number: :first_number, to_the_number: :second_number do
    enter value_of( the :first_number )
    press :plus
    enter value_of( the :second_number )
    press :equals
end
