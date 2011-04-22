Feature: Remember information between steps
  As a Step Free Cuker
  I want information captured in one step to be available in a later step
  So that I can deal with situations where dynamic information is required in later steps

  Background:
    Given you are a Step Free Cuker
    And   you were able to create a new Cuke Salad project
    And   you were able to create a role: called 'NewCustomer'

  Scenario: You can reuse information
    Given you were able to create a task, called 'do something' containing
      """
      in_order_to 'do something', remembering: :value do
        take_note_of :some_key, the( :value )
      end
      """
    And you were able to create a task, called 'find that the thing remembered was' containing
      """
      in_order_to 'find that the thing remembered was' do
        recall :some_key
      end
      """
    When you attempt to run a scenario: containing
      """
      Given I am a New Customer
      When I attempt to do something, remembering 'a value'
      Then I should find that the thing remembered was 'a value'
      """
    Then you should see it has 'passed'

  Scenario: You'll get feedback if you ask for something that wasn't noted
    Given you did not previously take note of something
    And you were able to create a task, called 'find that the thing remembered was' containing
    """
    in_order_to 'find that the thing remembered was' do
      recall :some_key
    end
    """
    When I attempt to run a scenario: containing
      """
      Given I am a New Customer
      Then I should find that the thing remembered was 'a value'
      """
    Then I should see it has 'failed'
    And I should see a reply that includes:
      """
            You tried to recall ':some_key' but no previous step appears to have taken note of that information
      """

