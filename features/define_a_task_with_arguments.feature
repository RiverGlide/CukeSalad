Feature: Define a Task with arguments
  As a Step Free Cuker
  You want to describe a task with additional info
  So that your task can use that information wisely 


  Background:
    Given you are a Step Free Cuker
    And   you were able to create a new Cuke Salad project
    And   you were able to create a role: called 'NewCustomer'
    
  Scenario Outline: A task can accept arguments
    Given you were able to create a task, called 'do some task' containing
      """
      in_order_to 'do some task', with: :detail do
        raise "Expected 'information' in the detail
        got '#{the :detail}'" unless the( :detail ) == 'information'
      end
      """
    When  you attempt to run a scenario: called 'something' containing
    """
    Given I am a New Customer
    When I attempt to <task_with_argument>
    """
    Then you should see it has 'passed'

    Examples:
      | task_with_argument             |
      | do some task: with 'information' |
      | do some task, with 'information' |
      | do some task: with "information" |
      | do some task, with "information" |
      
  Scenario: A task accepts tables
    Given you were able to create a task: called 'do something'
    When  you attempt to run a scenario, called 'something' containing
      """
      Given I am a New Customer
      When I attempt to do something, with
        | information |
        | first item  |
        | second item |
      """
    Then you should see it has 'passed'
