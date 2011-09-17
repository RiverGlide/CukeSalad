Feature: Expressing expectations
  As a Step Free Cuker
  You want to express expectations
  So that you know whether your scenario has passed

  Background:
    Given you are a Step Free Cuker
    And   you have created a file, at 'features/roles/role_with_answers.rb' containing
      """
      module RoleWithAnswers
        def see_the_answer
          get_the_answer_from_the_application
        end

        def get_the_answer_from_the_application
          # Pretending to get the answer from the application
          return 'correct answer'
        end
      end
      """
    And you have created a task, called 'see the answer is' containing
      """
      in_order_to 'see the answer is' do
        see_the_answer
      end
      """

  Scenario Outline: Simple Expectation
    When you run a scenario, containing
      """
      Given I am a Role With Answers
      Then I should see the answer is <answer>
      """
    Then you should see it has 'passed'

    Examples:
      |     answer       |
      | 'correct answer' |
      | "correct answer" |
