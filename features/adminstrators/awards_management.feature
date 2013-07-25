Feature: Awards Management
	In order to report on awards made
	an administrator
	must be able to manage the awards stored in the application

	Scenario: An administrator creates a new award
		Given I am signed in as a user with administrator rights
		And at least one year record exists
		And at least one organisation record exists
		And at least one award type record exists
		And at least one scout type record exists
		When I visit the new award page
		And I enter the details for a new award
		And I click the create award button
		Then I should see a successful creation message
		And I should see the new award

	Scenario: An administrator deletes an award
		Given I am signed in as a user with administrator rights
		And there is an award I wish to delete
		When I visit the awards admin page
		And I click the destroy button for the record I wish to delete
		Then I should see the awards admin page
		And I should not see the award that I deleted

	Scenario: An administrator changes the details for an award
		Given I am signed in as a user with administrator rights
		And there is an award I wish to change
		When I visit the awards admin page
		And I click the edit button for the record I wish to change
		And I enter the new details for the award
		And I click the update award button
		Then I should see a successful update message
		And I should see the updated award