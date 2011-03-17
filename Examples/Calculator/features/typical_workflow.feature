Feature: Typical Calculator Workflow
  As Callie, a calculating individual
  I want to interact with this calculator like any other calculator
  So that I can start using it straight away

Scenario Outline: See what I expect based on specific interactions
  Given I am a calculating individual
  When I attempt to perform: the following '<interactions>'
  Then I should see the result '<expected>'

Examples:
| interactions    | expected |
| 1 =             |        1 |
| 1 + =           |        2 |
| 1 - =           |        0 |
| 1 + = =         |        3 |
| 1 + 1 = 5 + =   |       10 |
