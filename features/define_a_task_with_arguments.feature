Feature: Define a Task with arguments
  As a Step Free Cuker
  You want to describe a task with additional info
  So that your task can use that information wisely 


  Background:
    Given you are a Step Free Cuker
    And   you were able to create a new Cuke Salad project
    And   you were able to create a role: called 'NewCustomer'
    
  Scenario: A task can accept arguments
    Given you were able to create a task: called 'do something'
    When  you attempt to run a scenario: called 'something' containing
    """
    Given I am a New Customer
    When I do something: with 'information'
    """
    Then you should see it has 'passed'

