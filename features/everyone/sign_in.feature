Feature: Sign in
	In order to access the application
	A registered user
	Must be able to sign in

		Scenario: Unregistered visitor attempts to sign in
			Given I do not exist as a registered user
			When I sign in
			Then I should see an invalid credentials message
			And I should not be signed in

		Scenario: Registered user signs in
			Given I exist as a registered user
			When I sign in
			Then I should see a successful sign in message
			And I should be signed in

		Scenario: Registered user attempts to sign in with an incorrect email address
			Given I exist as a registered user
			When I sign in with an incorrect email address
			Then I should see an invalid credentials message
			And I should not be signed in

		Scenario: Registered user attempts to sign in with an incorrect password
			Given I exist as a registered user
			When I sign in with an incorrect password
			Then I should see an invalid credentials message
			And I should not be signed in