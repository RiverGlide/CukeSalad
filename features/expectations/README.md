In your scenario, you'll want to express expectations in a number of forms.

The most comprehensive representation of the various ways you can express expectations is in the full set of cukesalad features.

The most basic is as follows:

    Then I should see the answer '10'

For this to work, you need a task that returns a value.

    in_order_to "see the answer" do
      look_at_the_display
    end

Your role will need a method called `look_at_the_display` that returns a value.

See the expectations examples for the fundamentals.

See the full set of cukesalad features for examples of the different forms your expectations can take.

All of the cukesalad features use cukesalad to test itself.
