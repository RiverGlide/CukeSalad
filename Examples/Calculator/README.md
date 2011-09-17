## Calculator Example

In the current folder...

Setup the environment:

    bundle install

Then you can run the examples quickly (via rack_test):

    rake check:features

To run these via a web browser, use:

    rake check:features:front_door

To run these via rack_test, use:

    rake check:features:side_door

To run these against the calculator API, use:

    rake check:features:back_door

To run the Calculator app

    rackup lib/config.ru

Then, in a browser, navigate to http://localhost:[port]
(The port to use  will be shown in the stdout) 

Enjoy!!
