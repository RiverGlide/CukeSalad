Feature: Addition
  As Harry, a calculating individual
  I want to quickly find out the sum of some numbers
	So that I don't have the delay of my slow mental arithmetic
	
Scenario Outline: Find the sum of two numbers
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


