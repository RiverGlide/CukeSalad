Feature: Describe the Task
  As a Step Free Cuker
  You want to describe your task
  So that your steps are executed 


  Background:
    Given you are a Step Free Cuker
    And   you were able to create a new Cuke Salad project
    And   you were able to create a role: called 'NewCustomer'
    
  Scenario: We'll tell you what you need to do to describe the task
    Given you did not create a task: called 'do something'
    When  you attempt to run a scenario: containing
      """
      Given I am a New Customer
      And I was able to do something
      """
    Then you should see it has 'failed'
    And  you should see a reply that includes:
      """
            I can't find a task called 'do something'. Have you created it?
            e.g.
              in_order_to 'do something' do
                # the actions
              end
      """

  Scenario: Once you've created the task, you see the step pass
    Given you did create a task: called 'do something'
    When  you attempt to run a scenario: containing
    """
    Given I am a New Customer
    And I was able to do something
    """
    Then you should see it has 'passed'
