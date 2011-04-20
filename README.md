# Cuke Salad

_Cucumber, washed and ready to eat for Friction-free ATDD/BDD_

**This is a work in progress - feedback welcome**
e-mail feedback to <talktous@riverglide.com>

You can see our current list of intended features here:
https://github.com/RiverGlide/CukeSalad/issues?labels=Feature

## This project has step-free access!

CukeSalad allows you to focus on the task at hand - expressing examples, the roles involved in those examples and what those roles can do with the product under development.

With CukeSalad you don't need to write step-definitions.

Of course, you still have to write some code - but only the code that expresses:

* the roles and the actions they can perform
* the tasks and the actions involved in completing that task

## Goals->Tasks->Actions
The terms *"actions"* and *"tasks"* above come from Task Analysis, as used in User Centred Design (UCD) of Human Computer Interfaces (HCI) a.k.a. User Experience (UX):

* *Goal:* What we’re trying to achieve which has one or more…
* *Tasks:* The high-level work-item that we complete to fulfil the goal, each having one or more…
* *Actions:* The specific steps or interactions we execute to complete the task.

More information about Goals, Tasks and Actions can be found in this [blog post](http://antonymarcano.com/blog/2011/03/goals-tasks-action/)

Let's see how this works with a simple example...

## Install

    gem install cukesalad

## Let's Get started

Create a new project called Calculator:

    cukesalad Calculator

Or, if you have an existing cucumber project that you want to configure to use cukesalad, you can type:

    cukesalad configure

## Write Features

In `features/`, let's create our first feature file - `a_place_to_start.feature`:

    Feature: A Place To Start
    As Callie, a calculating individual
    I want to know when my calculator is on
    So that I know when I can start calculating

    Scenario: Let's Begin
      Given I am a Calculating Individual
      When  I attempt to switch on the calculator
      Then  I should see the answer '0'

Let's take a moment to understand this scenario:

    Scenario: Let's Begin
      Given I am a <some role>
      When  I attempt to <do some task>
      Then  I should <ask some question> '<expected answer>'

To get this working, we don't need to write any steps. Instead, we describe tasks...

## Create Tasks

Explaining how to do a _task_ is easy:
Create a new file, `features/lib/tasks/switch_on_the_calculator.rb`

Remember the step `When  I attempt to switch on the calculator`

    in_order_to "switch on the calculator" do
      @calc = switch_on_the_calculator
    end

Remember the step `Then  I should see the answer '0'`
Now we need `task/see_the_answer.rb`

    in_order_to "see the answer" do
      look_at_the_display
    end

Now we've explained the _tasks_, we need to define the _role_ that performs them. In
this example, we need to explain how the `CalculatingIndividual` _role_ works...

## Create Roles

Remember the step `Given I am a Calculating Individual`?

We explain a _role_ by creating a new file
called `features/lib/roles/calculating_individual.rb`

    module CalculatingIndividual

      def switch_on_the_calculator
        @calculator = Calculator.new
      end

      def look_at_the_display
        @calculator.display
      end
    end

You'll need a class called Calculator on the load path of course, but that's it.

From your project folder, run (_note: '%' is our command prompt_)

  % cucumber

We now have our first passing Feature, without creating a single step definition!

## Wash, rinse, repeat

Let's try another scenario...

    Scenario Outline: Find the sum of two numbers
      Given I am a Calculating Individual
      And I was able to switch on the calculator
      When I attempt to add: the number '10' to the number '10'
      Then I should see the answer '20'

Notice that we've reused 'switch on the calculator'.

The new _When_ step has a slightly different layout.
Let's examine that for a second... Notice the ':' (colon) after <do something> and the name-value pairs:

    When I attempt to <do something>: <name> '<value>' <name> '<value>'

You can have as many name-value pairs as you like.

So, we need a task called `tasks/add.rb` that explains the individual actions required to complete the task:

    in_order_to "add" do
      enter @value_of(:the_number)
      press :plus
      enter @value_of(:to_the_number)
      press :equals
    end

Notice how the `value_of` lines use symbols that correspond to the wording `'the number '10' to the number '10'` in the "When" step.

There is some 'syntactic sugar' that we can use to dress this up a little and make it read nicer... a simple attribute mapping:

    in_order_to "add", the_number: :first_number, to_the_number: :second_number do
        enter the :first_number
        press :plus
        enter the :second_number
        press :equals
    end

All we've done is mapped "the_number" to "first_number". There is a special method called "the" that allows you to reference the mapped values rather than the symbols derived from the scenario.

Now all we need to do is modify our `calculating_individual.rb` to receive those calls...

    module CalculatingIndividual

      def switch_on_the_calculator
        @calculator = Calculator.new
        @operate_with = {
          plus: :+,
         minus: :-
        }
      end

      def enter value
        @calculator.enter value.to_i
      end

      def press next_operator
        if next_operator == :equals
          equals
        else
          @calculator.get_ready_to @operate_with[next_operator]
        end
      end

      def equals
        @calculator.equals
      end

      def look_at_the_display
        @calculator.display
      end
    end

Now, you can run cucumber again:

    % cucumber

There's no need to write `step_definitions`...
Simply express the _roles_ and the _tasks_ in clear,
concise, easy to read classes.

After adding some more scenarios and tasks and an alternative "Calculating Individual" (see below for why), our finished Calculator directory structure looks like this...

    ├── cucumber.yml
    ├── features
    │   ├── A_PlaceToStart.feature
    │   ├── Addition.feature
    │   ├── Complex_calculations.feature
    │   ├── LOOK_MA_NO_STEP_DEFS.txt
    │   ├── Subtraction.feature
    │   ├── Typical_workflow.feature
    │   ├── lib
    │   │   ├── alternative
    │   │   │   ├── roles
    │   │   │   │   └── calculating_web_user.rb
    │   │   │   └── tasks
    │   │   └── default
    │   │       ├── roles
    │   │       │   └── calculating_individual.rb
    │   │       └── tasks
    │   │           ├── add.rb
    │   │           ├── perform.rb
    │   │           ├── see_the_answer.rb
    │   │           ├── subtract.rb
    │   │           └── switch_on_the_calculator.rb
    │   └── support
    │       └── env.rb
    ├── lib
    │   ├── calculator.rb
    │   └── web_calculator.rb
    └── spec
        ├── calculator_spec.rb
        └── web_calculator_spec.rb

Take a look around the examples and the code to see how it all works. We hope you enjoy reading as much as we enjoyed writing it.

## Alternative Roles

As our features _describe the value of a calculator application and not its
implementation_, we have the opportunity to reuse them.

In the Calculator example, we create a new _role_ in
`./features/lib/alternative/roles/calculating_web_user.rb`, which we can swap
into our tests using a Cucumber profile defined in `features/cucumber.yml`:

    default --exclude features/lib/alternative/
    alternative -r features/lib/alternative/ -r features/support/env.rb -r features/lib/default/tasks/

We can run our alternative configuration like so:

  `%cucumber --profile alternative`

The Calculating Web User masquerades as the Calculating Individual from our
previous example, and provides the same API, allowing us to reuse all of our
existing features and _tasks_.

The alternative, `./lib/web_calculator.rb`, implementation is a simple [Sinatra](http://www.sinatrarb.com) application,
which we drive with the [Capybara](http://github.com/jnicklas/capybara) web testing framework.

By writing a single new _role_ class we're able to reuse all of our existing features,
_tasks_ and even the `Calculator` itself, which the web calculator delegates to in order to do its calculations.
