Feature: Addition
  As Harry, a calculating individual
  I want to quickly find out the sum of some numbers
	So that I don't have the delay of my slow mental arithmetic
	
Scenario: Find the sum of two numbers
  Given I was able to switch on the calculator
	When I attempt to add the numbers '10' and '5'
	Then I should get the answer '15'
  
