Feature: Define the Role
  As a Step Free Cuker
  You want to define a role
  So that you are ready to explain the tasks 

  Background:
    Given you are a Step Free Cuker

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

  Scenario: Roles which grammatically required an 'an'
    Given you did create a role: called 'UnregisteredCustomer'
    When  you attempt to run a scenario: containing
    """
    Given I am an Unregistered Customer
    """
    Then you should see it has 'passed'
