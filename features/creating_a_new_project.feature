Feature: Creating a New Project
  As a Step Free Cuker
  You want to set up your project to use use Cuke Salad
  So that you can start writing scenarios without step definitions

  Background:
    * you are a Step Free Cuker

  Scenario: How to get started
    * you start by interactively running, the command 'cukesalad' and answering 'y'
    * you follow by creating a file: at 'features/hello_cukesalad.feature' containing
        """
        Feature: Hello CukeSalad

          Scenario: Greetings
            Given I am a Newbie
            When I say hello world
        """
    * you then create a file: at 'features/role/newbie.rb' containing
      """
        module Newbie
          def say_hello
            puts 'CukeSalad says: Hello World!'
          end
        end
      """
    * you finally create another file: at 'features/lib/hello_world.rb' containing
      """
        in_order_to 'say hello world' do
          say_hello
        end
      """
    * you can then run: the command 'cucumber'
    * you should see it has 'passed'
    * you should also see a reply that includes:
      """
      CukeSalad says: Hello World!
      """
