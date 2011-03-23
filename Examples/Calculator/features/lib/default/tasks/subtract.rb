in_order_to "Subtract", the_number: :subtractor, from_the_number: :subtractee do
  enter value_of( the :subtractee )
  press :minus
  enter value_of( the :subtractor )
  press :equals
end
