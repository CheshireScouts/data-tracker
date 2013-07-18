Feature: Reports Menu
	In order to view any information produced by the system
	a registered user
	must have access to the reports menu

	Scenario: A registered user signs in
		Given I exist as a registered user
		When I sign in
		Then I should see a menu item to access the reports