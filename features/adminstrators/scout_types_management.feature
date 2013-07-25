Feature: Scout Types Management
	In order to report on membership and award data by scout type
	an administrator
	must be able to manage the scout types stored in the application

	Example Scout Types: Beaver Scout, Cub Scout

	Scenario: An administrator creates a new scout type
		Given I am signed in as a user with administrator rights
		When I visit the new scout type page
		And I enter the details for a new scout type
		And I click the create scout type button
		Then I should see a successful creation message
		And I should see the new scout type

	Scenario: An administrator deletes an scout type
		Given I am signed in as a user with administrator rights
		And there is an scout type I wish to delete
		When I visit the scout types admin page
		And I click the destroy button for the record I wish to delete
		Then I should see the scout types admin page
		And I should not see the scout type that I deleted

	Scenario: An administrator changes the details for an scout type
		Given I am signed in as a user with administrator rights
		And there is an scout type I wish to change
		When I visit the scout types admin page
		And I click the edit button for the record I wish to change
		And I enter the new details for the scout type
		And I click the update scout type button
		Then I should see a successful update message
		And I should see the updated scout type