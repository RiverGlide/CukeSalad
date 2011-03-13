# Cuke Salad 

_Cucumber, washed and ready to eat for Friction-free ATDD/BDD_

## Install

    gem install bundler
    gem update --system
    git clone git@github.com:RiverGlide/CukeNarrative.git
    bundle install

## Get started

Create a new project outside of the CukeSalad directory structure.
Inside the root of that project:

    mkdir features
    mkdir features/step_definitions
    mkdir features/roles
    mkdir features/tasks
    mkdir support

In idiomatic Cucumber style, we use `support/env.rb` to require _CukeSalad_ and
define the location of our project's _roles_ and _tasks_:

    $:.unshift(File.dirname(__FILE__) + '/../features/roles')
    $:.unshift(File.dirname(__FILE__) + '/../features/tasks')
    $:.unshift(File.dirname(__FILE__) + '/../../../lib') #where to find CukeSalad

    require 'cuke_salad'

## Write Features

In `features/`, let's create our first feature file - `A_PlaceToStart.feature`:

    Feature: A Place To Start
    As Harry, a calculating individual
    I want to know when my calculator is on
    So that I know when I can start calculating

    Scenario: Let's Begin
      Given I am a Calculating Individual
      When  I attempt to switch on the calculator
      Then  I should get the answer '0'

Let's take a moment to understand this scenario:

    Scenario: Let's Begin
      Given I am a <some role>
      When  I attempt to <do some task>
      Then  I should <ask some question> '<expected answer>'

To get this working, we don't need to write any steps. 
Just explain how to do the _task_ using a class...

## Create Tasks

Explaining how to do a _task_ is easy: 
Create a new file, `features/tasks/switch_on_the_calculator.rb`

    class SwitchOnTheCalculator
      include RSpec::Matchers
  
      def perform_as calculating_individual
        calculating_individual.should_not be_nil
      end
    end

Now we've explained the _task_, we need to define the _role_ that performs it. In
this example, we need to explain how the `CalculatingIndividual` _role_ works...

## Create Roles

We explain a _role_ by creating a new file 
called `features/roles/calculating_individual.rb`

    class CalculatingIndividual
    # This class represents the type of user of your application
    # This example also contains the implementation
    #  but obviously, this wouldn't normally be the case.
  
    attr_reader :display
  
    def initialize
      @display = 0
    end
  
Then run `cucumber Examples/Calculator`. 

We now have our first passing Feature, without writing a single step definition!

## Wash, rinse, repeat

Let's try another scenario...

    Scenario Outline: Find the sum of two numbers
      Given I am a Calculating Individual
      And I was able to switch on the calculator
      When I attempt to add: the number '10.0' to the number '10.0'
      Then I should get the answer '20.0'

Notice that we've reused 'switch on the calculator'. 

The new _When_ step has a slightly different layout. 
Let's examine that for a second...

    When I attempt to <do something>: <name> '<value>' <name> '<value>'

So, we need an action called add.rb:

    class Add < TaskWithSpecifics

      def perform_as calculating_individual
        calculating_individual.enter value_of(:the_number).to_f
        calculating_individual.plus
        calculating_individual.enter value_of(:to_the_number).to_f
        calculating_individual.plus
      end
    end

And then modify our `calculating_individual.rb` to receive those calls...

    class CalculatingIndividual
      # This class represents the type of user of your application
      # This example also contains the implementation
      # but obviously, this wouldn't normally be the case.
  
      attr_reader :display
  
      def initialize
        @display = 0
        @result = 0
      end
  
      def enter value
        @display = value
      end
  
      def plus
        @result = @result + @display
        @display = @result
      end
    end

There's no need to write `step_definitions`... 
Simply express the _roles_ and the _tasks_ in clear, 
concise, easy to read classes.

Our finished Calculator directory structure looks like this...

    └── Calculator/
      ├── cucumber.yml
      └── features/
        ├── A_PlaceToStart.feature
        ├── Addition.feature
        ├── roles/
        │   └── calculating_individual.rb
        ├── step_definitions
        │   └── calculator_steps.rb
        └── support/
        │   └── env.rb
        └── tasks/
            ├── add.rb
            ├── get_the_answer.rb
            └── switch_on_the_calculator.rb
