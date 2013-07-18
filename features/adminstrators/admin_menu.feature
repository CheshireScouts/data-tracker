Feature: Administration Menu
	In order to manage the standing data
	An administrator
	Must have access to the administration menu

	Scenario: A user with administrator rights signs in
		Given I exist as a user with administrator rights
		When I sign in
		Then I should see the administration menu
		And The administration menu should include an option to manage users
		And The administration menu should include an option to manage organisations
		And The administration menu should include an option to manage organisation types
		And The administration menu should include an option to manage membership records
		And The administration menu should include an option to manage scout types
		And The administration menu should include an option to manage membership types
		And The administration menu should include an option to manage award records
		And The administration menu should include an option to manage award types
		And The administration menu should include an option to manage years
		And The administration menu should include an option to manage census formats
		And The administration menu should include an option to manage census table formats

	Scenario: A user without administrator rights signs in
		Given I exist as a user without administrator rights
		When I sign in
		Then I should not see the administration menu
		When I try to visit an administration page
		Then I should see an unauthorized access message