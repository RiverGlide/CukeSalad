Feature: Addition
  As Harry, a calculating individual
  I want to quickly find out the sum of some numbers
	So that I don't have the delay of my slow mental arithmetic
	
Background:
	Given I have a Calculator
	  And I was able to switch on the calculator

Scenario: Find the sum of two positive whole numbers
	When I attempt to add the numbers '10' and '5'
	Then I should get the answer '15.0'
	
Scenario: Find the sum of two positive decimal numbers
	When I attempt to add the numbers '10.5' and '5'
	Then I should get the answer '15.5'