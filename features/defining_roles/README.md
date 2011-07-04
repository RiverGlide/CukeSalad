Your first step in your scenarios or in your background names a role relevant to your feature.
Cukesalad has an actor that adopts this role at run-time.

For example:

    Given I am a Calculating Individual

This will find a role called `CalculatingIndividual`. 
This role will have the methods that you call from within the tasks.

You would define this role as follows:

    module CalculatingIndividual
      def some_method_you_want_to_call
        # some stuff the method does
      end
      ...
    end

That's all there is to it. You can simply wrap another module if you want to.
We've done this in our scenarios for cukesalad as follows:

    module StepFreeCuker
      include Aruba::Api
    end

There are other things you can do, like initialise your 'role' by defining a `role_preparation` method.

Take a look through the examples in this folder.
