Feature: Define a Task
  As a Step Free Cuker
  You want to describe a task
  So that your steps that use that role are executed 

  Background:
    Given you are a Step Free Cuker
    And you have created a role, named 'NewCustomer'

  Scenario: We'll tell you what you need to do to describe the task
    When  you run a scenario: containing
      """
      Given I am a New Customer
      When I do something
      """
    Then you should see it has 'failed'
    And  you should see a reply that includes:
      """
            I can't find a task called 'do something'. Have you created it?
            e.g.
              in_order_to 'do something' do
                raise "TODO: You need to explain how to 'do something'"
              end
      """

  Scenario: Once you've created a task, you can use it in a Given step 
    Given you have created a task, called 'done something'
    When you run a scenario, containing
      """
      Given I am a New Customer
      And I have done something
      """
    Then you should see it has 'passed'

  Scenario: Tasks can be used in a When step too
    Given you have created a task, called 'do something'
    When you run a scenario, containing
      """
      Given I am a New Customer
      When I do something
      """
    Then you should see it has 'passed'

  Scenario: You can reuse a step between a Given and a When step
    Given you have created a task, called 'do something'
    When you run a scenario, containing
      """
      Given I am a New Customer
      And you were able to do something
      When I do something
      """
    Then you should see it has 'passed'

  Scenario: Tasks can contain numbers
    Given you have created a task, called 'do something for 123Company'
    When you run a scenario, containing
      """
      Given I am a New Customer
      When I do something for 123Company
      """
    Then you should see it has 'passed'

  Scenario Outline: There are all sorts of ways you can say things
    Given you have created a task, called 'do something'
    When you run a scenario: containing
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
      | When  I do something                |
      | And   I do something                |
      | And   I did do something            |
      | When  you do something              |
      | And   you do something              |
      | And   you did do something          |
      | Then  I should do something         |
      | And   I should do something         |
      | Then  you should do something       |
      | And   you should do something       |
