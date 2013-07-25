Feature: Organistions Management
	In order to report on membership and award data by organisation
	an administrator
	must be able to manage the organisations stored in the application

	Scenario: An administrator creates a new organisation
		Given I am signed in as a user with administrator rights
		And at least one organisation type record exists
		And at least one organisation record exists
		When I visit the new organisation page
		And I enter the details for a new organisation
		And I click the create organisation button
		Then I should see a successful creation message
		And I should see the new organisation

	Scenario: An administrator deletes an organisation
		Given I am signed in as a user with administrator rights
		And there is an organisation I wish to delete
		When I visit the organisations admin page
		And I click the destroy button for the record I wish to delete
		Then I should see the organisations admin page
		And I should not see the organisation that I deleted

	Scenario: An administrator changes the details for an organisation
		Given I am signed in as a user with administrator rights
		And there is an organisation I wish to change
		When I visit the organisations admin page
		And I click the edit button for the record I wish to change
		And I enter the new details for the organisation
		And I click the update organisation button
		Then I should see a successful update message
		And I should see the updated organisation