Feature: Define a Task
  As a Step Free Cuker
  You want to describe a task
  So that your steps that use that role are executed 


  Background:
    Given you are a Step Free Cuker
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

  Scenario Outline: Once you've created the task, you see the step pass
    Given you were able to create a task: called 'do something'
    When  you attempt to run a scenario: containing
    """
    Given I am a New Customer
    <step using the task>
    """
    Then you should see it has 'passed'

    Examples:
      | step using the task                 |
      | Given I was able to do something    |
      | And   I was able to do something    |
      | But   I did do something            |
      | Given you were able to do something |
      | And   you were able to do something |
      | But   you did do something          |
      | When  I attempt to do something     |
      | And   I attempt to do something     |
      | And   I did do something            |
      | When  you attempt to do something   |
      | And   you attempt to do something   |
      | And   you did do something          |
      | Then  I should do something         |
      | And   I should do something         |
      | Then  you should do something       |
      | And   you should do something       |

  Scenario Outline: Once you've created the task, you see the step pass
    Given you were able to create a task: called 'do something for 123Company'
    When  you attempt to run a scenario: containing
    """
    Given I am a New Customer
    <step using the task>
    """
    Then you should see it has 'passed'

    Examples:
      | step using the task                                |
      | Given I was able to do something for 123Company    |
      | And   I was able to do something for 123Company    |
      | But   I did do something for 123Company            |
      | Given you were able to do something for 123Company |
      | And   you were able to do something for 123Company |
      | But   you did do something for 123Company          |
      | When  I attempt to do something for 123Company     |
      | And   I attempt to do something for 123Company     |
      | And   I did do something for 123Company            |
      | When  you attempt to do something for 123Company   |
      | And   you attempt to do something for 123Company   |
      | And   you did do something for 123Company          |
      | Then  I should do something for 123Company         |
      | And   I should do something for 123Company         |
      | Then  you should do something for 123Company       |
      | And   you should do something for 123Company       |
