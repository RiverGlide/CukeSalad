Feature: Complex Calculations
  As Callie, a calculating individual
  I want to do more complicated calculations
  So that I am not tired out by doing mental arithmetic all day

Scenario Outline: Get the result of a more complex calculation
  Given I am a calculating individual
  And I was able to switch on the calculator
  When I attempt to calculate: with the following '<calculation>'
  Then I should get the answer '<correct_result>'

Examples:
| calculation     | correct_result |
| 1 + 1 + 1       |              3 |
| 10 + 5 - 3      |             12 |
| 10 + 5 - 3 - 12 |              0 |
