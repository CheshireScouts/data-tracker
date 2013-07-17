Feature: Sign in
	In order to access the application
	A user
	Must be able to sign in

		Scenario: User is not registered
			Given I do not exist as a registered user
			When I sign in
			Then I should see an invalid credentials message
			And I should not be signed in

		Scenario: User successfully signs in
			Given I exist as a registered user
			When I sign in
			Then I should see a successful sign in message
			And I should be signed in