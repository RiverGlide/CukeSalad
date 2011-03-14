Feature: Subtraction
  As Callie, a calculating individual
  I want to quickly find the difference between two numbers
	So that I am not tired out by doing mental arithmetic all day
	
Scenario Outline: Find the result of subtracting two numbers
  Given I am a Calculating Individual
  And I was able to switch on the calculator
  When I attempt to subtract: the number '<subtractor>' from the number '<subtractee>'
  Then I should get the answer '<result>'

	
Examples:
| subtractor | subtractee  | result|
|          0 |           0 |     0 |
|          0 |           1 |     1 |
|          1 |           1 |     0 |
|          5 |          10 |     5 |


