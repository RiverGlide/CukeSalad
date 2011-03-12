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

In features/step_definitions create a new step file, say calculator_steps.rb, which looks something like this:

    $:.unshift(File.dirname(__FILE__) + '/../roles')
    $:.unshift(File.dirname(__FILE__) + '/../tasks')
    $:.unshift(File.dirname(__FILE__) + '/../../../../lib') #where to find CukeSalad

    require 'cuke_salad'

In features, create your first feature spec

    Feature: A Place To Start
    As Harry, a calculating individual
    I want to know when my calculator is on
    So that I know when I can start calculating

    Scenario: Let's Begin
      Given I am a Calculating Individual
      When  I attempt to switch on the calculator
      Then  I should get the answer '0'

Let's take a second to understand this scenario:

    Scenario: Let's Begin
      Given I am a <some role>
      When  I attempt to <do some task>
      Then  I should <ask some question> '<expected answer>'

To get this working, you don't need to write any steps. Just explain how to do the task...

features/tasks/switch_on_the_calculator.rb

      require 'rubygems'
      require 'rspec/expectations'

      class SwitchOnTheCalculator
      include RSpec::Matchers
  
      def perform_as calculating_individual
        calculating_individual.should_not be_nil
      end
    end

And explain how the calculating individual works:

features/roles/calculating_individual.rb

    class CalculatingIndividual
    # This class represents the type of user of your application
    # This example also contains the implementation
    #  but obviously, this wouldn't normally be the case.
  
    attr_reader :display
  
    def initialize
      @display = 0
    end
  
In your features/step_definitions/calculator_steps file add the line:

    require 'calculating_individual'

Then run cucumber.

Let's try another scenario...

    Scenario Outline: Find the sum of two numbers
      Given I am a Calculating Individual
      And I was able to switch on the calculator
      When I attempt to add: the number '10.0' to the number '10.0'
      Then I should get the answer '20.0'

Notice that we've reused "switch on the calculator'. The new "When" step has a slightly different layout. Let's examine that for a second...

    When I attempt to <do something>: <name> '<value>' <name> '<value>'

So, we need an action called add.rb:

    $:.unshift File.join(File.dirname(__FILE__), "..", "lib")
    require 'task_with_specifics'

    class Add < TaskWithSpecifics

      def perform_as calculating_individual
        calculating_individual.enter value_of(:the_number).to_f
        calculating_individual.plus
        calculating_individual.enter value_of(:to_the_number).to_f
        calculating_individual.plus
      end
    end

And then modify your calculating_individual.rb to be able to receive those calls...

    class CalculatingIndividual
    # This class represents the type of user of your application
    # This example also contains the implementation
    #  but obviously, this wouldn't normally be the case.
  
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

Notice - no need to write the step_definitions... just express the roles and the tasks in clear, concise and easy to read classes.

