Feature: Edit Account Details
	A registered user of the application
	must to able to edit the personal details held on their account
	in order to ensure that the information held is correct and up to date

	Scenario: A registered user signs in
		Given I exist as a registered user
		When I sign in
		Then I should see a menu item to show my account details

	Scenario: A user changes their account details
		Given I am signed in
		When I click the account details menu item
		And I change my account details
		Then I should see an account updated message