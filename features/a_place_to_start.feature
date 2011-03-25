Feature: A Place To Start
  As Colin, a conscientious cuker
  I want to write Cucumber features without step definitions
  So that I don't have to focus on writing regular expressions,
  save time maintaining large step-def files 
  and spend more time delivering valuable features to my stakeholders 

  Scenario: Getting some guidance about an undefined role 
    Given I am a Conscientious Cuker
    And I am using Cuke Salad 
    When I write a simple feature like this:
    """
Feature: No Step Defs
  Scenario: Step free access
    Given I am a Step Free Cuker
    When I attempt to do an important task
    Then I should see an equally important answer
    """
    And I run `cucumber` 
    Then I should be told to define the 'Step Free Cuker' role 

  Scenario: Getting some guidance about an undefined task

  Scenario: Getting some guidance about an unknown question
