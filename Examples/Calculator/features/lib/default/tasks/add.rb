# This demonstrates how to use an attribute mapping 
#  to make the interactions within the task read more naturally
# In the scenario it might say "add: the number '5', to the number '10'
# The form illustrated below simply maps the elements the_number and to_the_number
#  to alternative symbols that make the interactions read more like real instructions
# See subtract.rb for a way of writing tasks that reuses the common interactions 
# required to perform calculations.
in_order_to "Add", the_number: :first_number, to_the_number: :second_number do
    enter the :first_number 
    press :plus
    enter the :second_number 
    press :equals
end
