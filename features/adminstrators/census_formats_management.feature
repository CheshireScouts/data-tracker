Feature: Census Formats Management
	In order to specify how to extract the census data from HQ
	an administrator
	must be able to manage the census formats stored in the application

	Scenario: An administrator creates a new census format
		Given I am signed in as a user with administrator rights
		When I visit the new census format page
		And I enter the details for a new census format
		And I click the create census format button
		Then I should see a successful creation message
		And I should see the new census format

	Scenario: An administrator deletes a census format
		Given I am signed in as a user with administrator rights
		And there is a census format I wish to delete
		When I visit the census formats admin page
		And I click the destroy button for the record I wish to delete
		Then I should see the census formats admin page
		And I should not see the census format that I deleted

	Scenario: An administrator changes the details for a census format
		Given I am signed in as a user with administrator rights
		And there is a census format I wish to change
		When I visit the census formats admin page
		And I click the edit button for the record I wish to change
		And I enter the new details for the census format
		And I click the update census format button
		Then I should see a successful update message
		And I should see the updated census format