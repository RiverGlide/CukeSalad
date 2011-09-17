These scenarios are examples of what you might write using [cukesalad](http://cukesalad.info).

cukesalad is an extension to cucumber that does away with regular expression. For example, to write this:

    When I add, the number '1' to the number '2'

You only need to write something like this:

    in_order_to 'add', the_number: :first_number, and_the_number: :second_number do
      enter the :first_number 
      press :plus
      enter the :second_number 
      press :equals
    end

You can find the code behind these [on Github](https://github.com/RiverGlide/CukeSalad/tree/master/Examples/Calculator).
