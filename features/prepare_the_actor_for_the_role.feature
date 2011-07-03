Feature: Prepare the actor for the role
  As a Step Free Cuker
  You want the role to initialize some things
  So that you can define the things that the role always does at the start

  Background:
    Given you are a Step Free Cuker
    And you were able to create a new Cuke Salad project

  Scenario: Initialization
    Given you were able to create a file, at 'features/roles/role_with_prep.rb' containing
    """
    module RoleWithPrep
      def role_preparation
        take_note_of :something, 'important'
      end
    end
    """
    And you were able to create a task, called 'recall something' containing
    """
    in_order_to 'recall something' do
      recall :something
    end
    """
    When you attempt to run a scenario, containing
    """
    Given I am a Role With Prep
    Then I should recall something 'important'
    """
    Then you should see it has 'passed'

