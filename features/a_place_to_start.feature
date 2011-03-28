@in-development
Feature: A Place To Start: Making the first step
  As a Step Free Cuker
  You want guidance on how you establish the role
  So that you know what to do next

  Scenario: We'll tell you what you need to do to establish the role
    Given you are a Step Free Cuker
    And   you did not create a role: called 'NewCustomer'
    When  you attempt to run a scenario: containing
    """
    Given I am a New Customer
    """
    Then you should see the step as 'pending'
    And  you should see a message saying 
    """
    I can't find a role called 'NewCustomer'.
    You may need to put it on the load path,
    or perhaps you haven't created one yet?
    For example:
      module StepFreeCuker
      end
    """

  Scenario: Once you've created the role, you see the step pass
    Given you are a Step Free Cuker
    And   you did create a role: called 'StepFreeCuker'
    When  you attempt to run a scenario: containing
    """
    Given I am a Step Free Cuker
    """
    Then you should see the step is 'passed'
