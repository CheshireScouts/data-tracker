Feature: Membership Types Management
	In order to report on membership and award data by membership type
	an administrator
	must be able to manage the membership types stored in the application

	Example Membership Types: Member, Associate Member

	Scenario: An administrator creates a new membership type
		Given I am signed in as a user with administrator rights
		When I visit the new membership type page
		And I enter the details for a new membership type
		And I click the create membership type button
		Then I should see a successful creation message
		And I should see the new membership type

	Scenario: An administrator deletes an membership type
		Given I am signed in as a user with administrator rights
		And there is an membership type I wish to delete
		When I visit the membership types admin page
		And I click the destroy button for the record I wish to delete
		Then I should see the membership types admin page
		And I should not see the membership type that I deleted

	Scenario: An administrator changes the details for an membership type
		Given I am signed in as a user with administrator rights
		And there is an membership type I wish to change
		When I visit the membership types admin page
		And I click the edit button for the record I wish to change
		And I enter the new details for the membership type
		And I click the update membership type button
		Then I should see a successful update message
		And I should see the updated membership type