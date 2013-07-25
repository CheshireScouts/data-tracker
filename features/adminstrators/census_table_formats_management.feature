Feature: Census Table Formats Management
	In order to specify how to extract the census data from HQ
	an administrator
	must be able to manage the census table formats stored in the application

	Scenario: An administrator creates a new census table format
		Given I am signed in as a user with administrator rights
		And at least one census format record exists
		And at least one scout type record exists
		And at least one membership type record exists
		When I visit the new census table format page
		And I enter the details for a new census table format
		And I click the create census table format button
		Then I should see a successful creation message
		And I should see the new census table format

	Scenario: An administrator deletes a census table format
		Given I am signed in as a user with administrator rights
		And there is a census table format I wish to delete
		When I visit the census table formats admin page
		And I click the destroy button for the record I wish to delete
		Then I should see the census table formats admin page
		And I should not see the census table format that I deleted

	Scenario: An administrator changes the details for a census table format
		Given I am signed in as a user with administrator rights
		And there is a census table format I wish to change
		When I visit the census table formats admin page
		And I click the edit button for the record I wish to change
		And I enter the new details for the census table format
		And I click the update census table format button
		Then I should see a successful update message
		And I should see the updated census table format