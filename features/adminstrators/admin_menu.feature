Feature: Administration Menu
	In order to manage the standing data
	An administrator
	Must have access to the administration menu

	Scenario: A user with administrator rights signs in
		Given I exist as a user with administrator rights
		When I sign in
		Then I should see the administration menu

	Scenario: A user without administrator rights signs in
		Given I exist as a user without administrator rights
		When I sign in
		Then I should not see the administration menu