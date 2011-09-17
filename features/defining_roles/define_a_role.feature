Feature: Define the Role
  As a Step Free Cuker
  you want to define a role
  so that you are ready to explain the tasks 

  Background:
    * you are a Step Free Cuker

  Scenario: We'll tell you what you need to do to establish the role
    When you run a scenario, containing
      """
      Given I am a New Customer
      """
    * you should see it has 'failed'
    * you should also see a reply that includes:
      """
            I can't find a role called 'NewCustomer'. Have you created it?
            e.g.
              module NewCustomer
              end
      """

  Scenario: How to establish the role
    * you start by creating a role, named 'NewCustomer'
    * you run a scenario: containing
      """
      Given I am a New Customer
      """
    * you should see it has 'passed'

  Scenario: How to establish roles that grammatically require an 'an'
    * you have created a role, named 'UnregisteredCustomer'
    * you attempt to run a scenario: containing
      """
      Given I am an Unregistered Customer
      """
    * you should see it has 'passed'
