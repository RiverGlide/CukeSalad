Feature: Creating a New Project
  As a Step Free Cuker
  You want to set up your project to use use Cuke Salad 
  So that you can start writing scenarios without step definitions 

  Scenario: Set up your project and verify that you can use CukeSalad
    Given you are a Step Free Cuker
    And   you were able to create directories: as follows
    """
    features
    features/lib
    features/lib/roles
    features/lib/tasks
    features/support
    """
    And you were able to create a file: at 'features/support/env.rb' containing
      """
      $:.unshift(File.dirname(__FILE__) + "/../../../../lib") #where to find CukeSalad
             
      require "cukesalad"
      """
    And you were able to create a file: at 'features/hello_cukesalad.feature' containing
      """
      Feature: Hello CukeSalad
  
        Scenario: Greetings
          When I say hello CukeSalad
      """ 
    When you attempt to run: the command 'cucumber'  
    Then  you should see a reply that includes:
    """
    CukeSalad says: Hello!!
    """
   And  you should see it has 'passed'
