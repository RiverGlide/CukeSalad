Feature: A Place To Start
	As Harry, a calculating individual
	I want to know when my calculator is on
	So that I know when I can start calculating

Scenario: Start with Zero
	When I attempt to switch on the calculator
	Then I should get the answer '0'
	
Scenario: Enter a number
	Given I was able to switch on the calculator
	When I attempt to enter '1'
	Then I should get the answer '1' 
