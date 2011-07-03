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
        do_something_important
      end

      def do_something_important
        @something = 'something important was done'
      end

      def see_what_was_done
        @something
      end
    end
    """
    And you were able to create a task, called 'see that' containing
    """
    in_order_to 'see that' do
      see_what_was_done
    end
    """
    When you attempt to run a scenario, containing
    """
    Given I am a Role With Prep
    Then I should see that 'something important was done'
    """
    Then you should see it has 'passed'

