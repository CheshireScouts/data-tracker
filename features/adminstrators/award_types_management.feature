Feature: Award Types Management
	In order to report on the types of award being made
	an administrator
	must be able to manage the award types stored in the application

	Scenario: An administrator creates a new award type
		Given I am signed in as a user with administrator rights
		When I visit the new award type page
		And I enter the details for a new award type
		And I click the create award type button
		Then I should see a successful creation message
		And I should see the new award type

	Scenario: An administrator deletes an award type
		Given I am signed in as a user with administrator rights
		And there is an award type I wish to delete
		When I visit the award types admin page
		And I click the destroy button for the record I wish to delete
		Then I should see the award types admin page
		And I should not see the award type that I deleted

	Scenario: An administrator changes the details for an award type
		Given I am signed in as a user with administrator rights
		And there is an award type I wish to change
		When I visit the award types admin page
		And I click the edit button for the record I wish to change
		And I enter the new details for the award type
		And I click the update award type button
		Then I should see a successful update message
		And I should see the updated award type