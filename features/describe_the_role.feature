Feature: Start With The Role
  As a Step Free Cuker
  You want to name your role
  So that you are ready to explain the tasks 

  Background: Some things you'll have to do first
    Given you are a Step Free Cuker
    And   you were able to create a new Cuke Salad project

  Scenario: We'll tell you what you need to do to establish the role
    Given you did not create a role: called 'NewCustomer'
    When  you attempt to run a scenario: containing
      """
      Given I am a New Customer
      """
    Then you should see it has 'failed'
    And  you should see a reply that includes:
      """
            I can't find a role called 'NewCustomer'. Have you created it?
            e.g.
              module NewCustomer
              end
      """

  Scenario: Once you've created the role, you see the step pass
    Given you did create a role: called 'NewCustomer'
    When  you attempt to run a scenario: containing
    """
    Given I am a New Customer
    """
    Then you should see it has 'passed'
