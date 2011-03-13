# Cuke Salad 

_Cucumber, washed and ready to eat for Friction-free ATDD/BDD_

**This is an early release to get community feedback**

There are a few step structures that need to be implemented before it becomes usable on a real project

This implementation is the result of lessons learned on real projects

__CukeSalad - a **RiverGlide** innovation__

http://RiverGlide.com

## This project has step-free access!

That's right, with CukeSalad you don't need to write step-definitions!

CukeSalad allows you to focus on the task at hand - expressing examples, the roles involved in those examples and what those roles can do with the product under development.

You got it... no step-definitions, therefore no regular expressions, no scrolling through ever-growing _step.rb files.

Of course, you still have to write some code - but only the code that expresses:

* the roles and the actions they can perform 
* the tasks and the actions involved in completing that task

## Goals->Tasks->Actions
The terms *"actions"* and *"tasks"* above come from Task Analysis, as used in User Centred Design (UCD) of Human Computer Interfaces (HCI) a.k.a. User Experience (UX):

* *Goal:* What we’re trying to achieve which has one or more…
* *Tasks:* The high-level work-item that we complete to fulfil the goal, each having one or more…
* *Actions:* The specific steps or interactions we execute to complete the task.

More information about Goals, Tasks and Actions can be found here:
http://antonymarcano.com/blog/2011/03/goals-tasks-action/

Let's see how this works with a simple example...

## Install

    gem install bundler
    gem update --system
    git clone git@github.com:RiverGlide/CukeNarrative.git
    bundle install

## Let's Get started

Create a new project outside of the CukeSalad directory structure, e.g.:

    mkdir ~/projects/Calculator
    cd ~/projects/Calculator

Inside the root of that project...

    mkdir features
    mkdir features/support
    mkdir features/roles
    mkdir features/tasks

In idiomatic Cucumber style, we use `features/support/env.rb` to require _CukeSalad_ and
define the location of our project's _roles_ and _tasks_ e.g.:

    $:.unshift(File.dirname(__FILE__) + '/../roles')
    $:.unshift(File.dirname(__FILE__) + '/../tasks')
    $:.unshift(File.dirname(__FILE__) + '/../../../../lib') #where to find CukeSalad

    require 'cuke_salad'
    begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end

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
  
From your project folder, run (_note: '%' is our command prompt_)

  % cucumber 

We now have our first passing Feature, without creating a single step definition!

## Wash, rinse, repeat

Let's try another scenario...

    Scenario Outline: Find the sum of two numbers
      Given I am a Calculating Individual
      And I was able to switch on the calculator
      When I attempt to add: the number '10.0' to the number '10.0'
      Then I should get the answer '20.0'

Notice that we've reused 'switch on the calculator'. 

The new _When_ step has a slightly different layout. 
Let's examine that for a second... Notice the ':' (colon) after <do something> and the name-value pairs:

    When I attempt to <do something>: <name> '<value>' <name> '<value>'

So, we need a task called `tasks/add.rb` that explains the individual actions required to complete the task:

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

Now, you can run cucumber again:

    % cucumber 

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
        └── support/
        │   └── env.rb
        └── tasks/
            ├── add.rb
            ├── get_the_answer.rb
            └── switch_on_the_calculator.rb
