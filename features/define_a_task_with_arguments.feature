Feature: Define a Task with arguments
  As a Step Free Cuker
  You want to describe a task with additional info
  So that your task can use that information wisely 


  Background:
    Given you are a Step Free Cuker
    And   you were able to create a new Cuke Salad project
    And   you were able to create a role: called 'NewCustomer'
    And   you were able to create a task: called 'do something'
    
  Scenario Outline: A task can accept arguments
    When  you attempt to run a scenario: called 'something' containing
    """
    Given I am a New Customer
    <the_step>
    """
    Then you should see it has 'passed'

    Examples:
      | the_step                                |
      | When I attempt to do something: with 'information' |
      | When I attempt to do something, with 'information' |
      
  Scenario: A task accepts tables
    When you attempt to run a scenario, called 'something' containing
      """
      Given I am a New Customer
      When I attempt to do something, with
        | information |
        | first item  |
        | second item |
      """
    Then you should see it has 'passed'
