Feature: Creating a New Project
  As a Step Free Cuker
  You want to set up your project to use use Cuke Salad
  So that you can start writing scenarios without step definitions

  Scenario: Set up your project and verify that you can use CukeSalad
    Given you are a Step Free Cuker
    And   you were able to interactively run, the command 'cukesalad' and type 'y'
    And you were able to create a file: at 'features/hello_cukesalad.feature' containing
      """
      Feature: Hello CukeSalad

        Scenario: Greetings
          Given I am a Newbie
          When I say hello world
      """
    And you were able to create a file: at 'features/role/newbie.rb' containing
    """
      module Newbie
        def say_hello
          puts 'CukeSalad says: Hello World!'
        end
      end
    """
    And you were able to create a file: at 'features/lib/hello_world.rb' containing
    """
      in_order_to 'say hello world' do
        say_hello
      end
    """
    When you attempt to run: the command 'cucumber'
    Then  you should see a reply that includes:
    """
    CukeSalad says: Hello World!
    """
    And  you should see it has 'passed'
