Feature: Sign in
	In order to protect against unauthorised access to the application
	A signed in user
	Must be able to sign out

	Scenario: User signs out
		Given I am signed in
		When I sign out
		Then I should see a successful sign out message
		And I should be signed out
		When I return to the site
		Then I should be signed out