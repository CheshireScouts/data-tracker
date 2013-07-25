Feature: Years Management
	In order to report on membership and award data by year
	an administrator
	must be able to manage the years stored in the application

	Scenario: An administrator creates a new year
		Given I am signed in as a user with administrator rights
		And at least one census format record exists 
		When I visit the new year page
		And I enter the details for a new year
		And I click the create year button
		Then I should see a successful creation message
		And I should see the new year

	Scenario: An administrator deletes an year
		Given I am signed in as a user with administrator rights
		And there is an year I wish to delete
		When I visit the years admin page
		And I click the destroy button for the record I wish to delete
		Then I should see the years admin page
		And I should not see the year that I deleted

	Scenario: An administrator changes the details for an year
		Given I am signed in as a user with administrator rights
		And there is an year I wish to change
		When I visit the years admin page
		And I click the edit button for the record I wish to change
		And I enter the new details for the year
		And I click the update year button
		Then I should see a successful update message
		And I should see the updated year