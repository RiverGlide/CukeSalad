# Defining Tasks

In your scenario, once you've named you role, you can write tasks that use methods on that role.
For example:

    Given I was able to switch on the calculator

Needs a task called 'switch on the calculator'. You do this by creating a file, usually in `features/tasks`, called `switch_on_the_calculator.rb` with the following:

    in_order_to "switch on the calculator" do
      switch_on_the_calculator
    end

This is the most basic example. Look through the other examples to see how to pass arguments into your task.
