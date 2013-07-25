Feature: Organisation Types Management
	In order to report on membership and award data by organisation type
	an administrator
	must be able to manage the organisation types stored in the application

	Example Organisation Types: County, District, Group

	Scenario: An administrator creates a new organisation type
		Given I am signed in as a user with administrator rights
		When I visit the new organisation type page
		And I enter the details for a new organisation type
		And I click the create organisation type button
		Then I should see a successful creation message
		And I should see the new organisation type

	Scenario: An administrator deletes an organisation type
		Given I am signed in as a user with administrator rights
		And there is an organisation type I wish to delete
		When I visit the organisation types admin page
		And I click the destroy button for the record I wish to delete
		Then I should see the organisation types admin page
		And I should not see the organisation type that I deleted

	Scenario: An administrator changes the details for an organisation type
		Given I am signed in as a user with administrator rights
		And there is an organisation type I wish to change
		When I visit the organisation types admin page
		And I click the edit button for the record I wish to change
		And I enter the new details for the organisation type
		And I click the update organisation type button
		Then I should see a successful update message
		And I should see the updated organisation type